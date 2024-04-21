//
//  Networker.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine

protocol Networking {
    func fetch<R: Request>(_ request: R) -> AnyPublisher<R.Output, CustomError>
}

class Networker: Networking {
        
    lazy private var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        URLCache.shared.diskCapacity = Int.max
        return URLSession(configuration: configuration)
    }()
    
    func fetch<R: Request>(_ request: R) -> AnyPublisher<R.Output, CustomError> {
        return session
            .dataTaskPublisher(for: request.urlRequest)
            .subscribe(on: OperationQueue())
            .receive(on: DispatchQueue.main)
            .compactMap { $0.data }
            .tryMap(request.decode)
            .mapError { error in
                switch error {
                case let urlError where (urlError as? URLError)?.code == .networkConnectionLost:
                    return CustomError.networkConnectionLost
                case let urlError where (urlError as? URLError)?.code == .notConnectedToInternet:
                    return CustomError.notConnectedToInternet
                case let decodingError where (decodingError as? DecodingError) != nil:
                    return CustomError.decodingError
                default:
                    return CustomError.generalError
                }
            }
            .eraseToAnyPublisher()
    }
}

enum CustomError: Error {
    case networkConnectionLost
    case notConnectedToInternet
    case decodingError
    case generalError
}
