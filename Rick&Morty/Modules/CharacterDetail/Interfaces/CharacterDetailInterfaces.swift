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
    func showAlert(title: String, message: String, actionName: String, completion: (() -> Void)?)
}

protocol CharacterDetailInteractorInterface: InteractorInterface {
    func getEpisodesList(with list: [String]) -> AnyPublisher<[EpisodeEntity], CustomError>
}
