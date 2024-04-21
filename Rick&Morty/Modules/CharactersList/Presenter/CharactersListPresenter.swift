//
//  CharactersListPresenter.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine

final class CharactersListPresenter {

    // MARK: - Private properties -

    private let interactor: CharactersListInteractorInterface
    private let wireframe: CharactersListWireframeInterface
    private var allItems: [CharacterEntity] = []
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public properties -
    
    @Published var items: [CharacterEntity] = []
    var isSearching: Bool = false
    var search: String = .empty

    // MARK: - Lifecycle -

    init(
        interactor: CharactersListInteractorInterface,
        wireframe: CharactersListWireframeInterface
    ) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.getCharactersList()
    }
    
    // MARK: - Private methods -
    
    private func assign(_ items: [CharacterEntity]) {
        if self.items.isEmpty {
            self.items = items
        } else {
            self.items.append(contentsOf: items)
        }
        allItems = self.items
    }
}

// MARK: - CharactersListPresenterInterface -

extension CharactersListPresenter: CharactersListPresenterInterface {
    
    var last: CharacterEntity? { items.last }
    
    func getCharactersList() {
        interactor
            .getCharactersList()
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .failure(let failure) where failure == .notConnectedToInternet:
                    self.wireframe.showAlert(title: "Error", message: "Sin conexion a internet", actionName: "Reitentar") { [weak self] in
                        guard let self else { return }
                        self.getCharactersList()
                    }
                case .failure(let failure) where failure == .networkConnectionLost:
                    self.wireframe.showAlert(title: "Error", message: "Perdida la conexion", actionName: "Reitentar") { [weak self] in
                        guard let self else { return }
                        self.getCharactersList()
                    }
                case .finished:
                    break
                case .failure:
                    self.wireframe.showAlert(title: "Error", message: "Se presento un problema, por favor reintenta mas tarde", actionName: "Reitentar", completion: nil)
                }
            }, receiveValue: { [weak self] items in
                guard let self else { return }
                self.assign(items)
            })
            .store(in: &cancellables)
    }
    
    func hasNext() -> Bool {
        return items.isEmpty || interactor.hasNext()
    }
    
    func search(query: String) {
        isSearching = !query.isEmpty
        guard !query.isEmpty else {
            items = allItems
            return
        }
        items = allItems.filter { item in
            let stringMatch = item.name.lowercased().ranges(of: query.lowercased())
            return !stringMatch.isEmpty
        }
    }
    
    func goToCharactersDetail(item: CharacterEntity) {
        wireframe.goToCharactersDetail(item: item)
    }
}
