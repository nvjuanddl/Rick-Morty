//
//  CharacterDetailWireframe.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import UIKit

final class CharacterDetailWireframe: BaseWireframe<LazyHostingViewController<CharacterDetailView>> {

    // MARK: - Lifecycle -

    init(item: CharacterEntity) {
        let moduleViewController = LazyHostingViewController<CharacterDetailView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let interactor = CharacterDetailInteractor(networker: Networker())
        let presenter = CharacterDetailPresenter(interactor: interactor, wireframe: self, item: item)
        moduleViewController.rootView = CharacterDetailView(presenter: presenter)
    }
}

// MARK: - CharacterDetailWireframeInterface -

extension CharacterDetailWireframe: CharacterDetailWireframeInterface { 
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
