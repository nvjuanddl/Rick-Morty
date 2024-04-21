//
//  CharacterDetailInterfaces.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine

protocol CharacterDetailWireframeInterface: WireframeInterface {
    func goBack()
}

protocol CharacterDetailInteractorInterface: InteractorInterface {
    func getEpisodesList(with list: [String]) -> AnyPublisher<[EpisodeEntity], Error>
}
