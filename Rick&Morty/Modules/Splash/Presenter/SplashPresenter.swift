//
//  SplashPresenter.swift
//  RickAndMorty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation
import Combine

final class SplashPresenter {

    // MARK: - Private properties -

    private let interactor: SplashInteractorInterface
    private let wireframe: SplashWireframeInterface

    // MARK: - Lifecycle -

    init(
        interactor: SplashInteractorInterface,
        wireframe: SplashWireframeInterface
    ) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - SplashPresenterInterface -

extension SplashPresenter: SplashPresenterInterface {
    
    var formatter: SplashFormatter {
        return SplashFormatter()
    }
    
    func goToCharactersList() {
        wireframe.goToCharactersList()
    }
}
