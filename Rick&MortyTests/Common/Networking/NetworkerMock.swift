//
//  NetworkerMock.swift
//  Rick&MortyTests
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine
@testable import Rick_Morty

class NetworkerMock: Networking {

    var canResponseSuccess = true
    var data: Data?
    
    func fetch<R>(_ request: R) -> AnyPublisher<R.Output, CustomError> where R: Request  {
        if canResponseSuccess, let data = self.data {
            do {
                return Just(try request.decode(data)).setFailureType(to: CustomError.self).eraseToAnyPublisher()
            } catch {
                return Fail<R.Output, CustomError>(error: .generalError).eraseToAnyPublisher()
            }
        } else {
            return Fail<R.Output, CustomError>(error: .generalError).eraseToAnyPublisher()
        }
    }
}
