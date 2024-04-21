//
//  CharacterDetailInteractor.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Combine
import Foundation

final class CharacterDetailInteractor {
    
    // MARK: - Private properties -
    
    private var networker: Networking
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle -
    
    init(networker: Networking) {
        self.networker = networker
    }
}

// MARK: - CharacterDetailInteractorInterface -

extension CharacterDetailInteractor: CharacterDetailInteractorInterface {
    
    func loadEpisodeDetail(url: String) -> AnyPublisher<EpisodeEntity, Error> {
        let request = EpisodeRequest(urlString: url)
        return self.networker.fetch(request).eraseToAnyPublisher()
    }
    
    func getEpisodesList(with list: [String]) -> AnyPublisher<[EpisodeEntity], Error> {
        let publishers: [AnyPublisher<EpisodeEntity, Error>] = list.map(loadEpisodeDetail)
        return Publishers.MergeMany(publishers)
            .collect(publishers.count)
            .eraseToAnyPublisher()
    }
}
