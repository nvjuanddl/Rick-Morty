//
//  CharacterDetailPresenter.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine

final class CharacterDetailPresenter: ObservableObject {
    
    // MARK: - Private properties -

    private let wireframe: CharacterDetailWireframeInterface
    private let interactor: CharacterDetailInteractorInterface
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Public properties -

    @Published var item: CharacterEntity
    @Published var episodesList: [EpisodeEntity] = []

    // MARK: - Lifecycle -

    init(
        interactor: CharacterDetailInteractorInterface,
        wireframe: CharacterDetailWireframeInterface,
        item: CharacterEntity
    ) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.item = item
        self.getEpisodesList()
    }
    
    // MARK: - Public methods -
    
    func goBack() {
        wireframe.goBack()
    }
    
    func getEpisodesList() {
        interactor
            .getEpisodesList(with: item.episode)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    print(failure)
                }
            }, receiveValue: { [weak self] items in
                guard let self else { return }
                self.episodesList = items
            })
            .store(in: &cancellables)
    }
}
