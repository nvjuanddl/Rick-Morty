//
//  SplashWireframe.swift
//  RickAndMorty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import UIKit

final class SplashWireframe: BaseWireframe<LazyHostingViewController<SplashView>> {

    // MARK: - Lifecycle -

    init() {
        let moduleViewController = LazyHostingViewController<SplashView>()
        super.init(viewController: moduleViewController)
        let interactor = SplashInteractor(networker: Networker())
        let presenter = SplashPresenter(interactor: interactor, wireframe: self)
        moduleViewController.rootView = SplashView(presenter: presenter)
    }

}

// MARK: - SplashWireframeInterface -

extension SplashWireframe: SplashWireframeInterface {
    
    func goToCharactersList() {
    }
}
