//
//  CharactersListWireframe.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import UIKit

final class CharactersListWireframe: BaseWireframe<LazyHostingViewController<CharactersListView>> {

    // MARK: - Lifecycle -

    init() {
        let moduleViewController = LazyHostingViewController<CharactersListView>()
        super.init(viewController: moduleViewController)
        let interactor = CharactersListInteractor(networker: Networker())
        let presenter = CharactersListPresenter(interactor: interactor, wireframe: self)
        moduleViewController.rootView = CharactersListView(presenter: presenter)
    }

}

// MARK: - CharactersListWireframeInterface -

extension CharactersListWireframe: CharactersListWireframeInterface {
    
    func goToCharactersDetail(item: CharacterEntity) {
    }
}
