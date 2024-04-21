//
//  CharactersListInteractor.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Combine
import Foundation

final class CharactersListInteractor {
    
    // MARK: - Private properties -
    
    private var networker: Networking
    private var cancellables: Set<AnyCancellable> = []
    private var nextURL: String?
    
    // MARK: - Lifecycle -
    
    init(networker: Networking) {
        self.networker = networker
    }
}

// MARK: - CharactersListInteractorInterface -

extension CharactersListInteractor: CharactersListInteractorInterface {
    
    func hasNext() -> Bool {
        return nextURL != nil
    }
    
    func getCharactersList() -> AnyPublisher<[CharacterEntity], CustomError> {
        let request = CharactersListRequest(urlString: nextURL)
        return networker.fetch(request).compactMap { response in
            self.nextURL = response.info.next
            return response.characters
        }.eraseToAnyPublisher()
    }
}
