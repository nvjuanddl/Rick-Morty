//
//  CharactersListInterfaces.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Combine

protocol CharactersListWireframeInterface: WireframeInterface {
    func goToCharactersDetail(item: CharacterEntity)
    func showAlert(title: String, message: String, actionName: String, completion: (() -> Void)?)
}

protocol CharactersListInteractorInterface: InteractorInterface {
    func hasNext() -> Bool
    func getCharactersList() -> AnyPublisher<[CharacterEntity], CustomError>
}

protocol CharactersListPresenterInterface: ObservableObject {
    var items: [CharacterEntity] { get }
    var last: CharacterEntity? { get }
    var isSearching: Bool { get }
    
    func getCharactersList()
    func hasNext() -> Bool
    func search(query: String)
    func goToCharactersDetail(item: CharacterEntity)
}
