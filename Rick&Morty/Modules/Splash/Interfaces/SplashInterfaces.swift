//
//  SplashInterfaces.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Combine

protocol SplashWireframeInterface: WireframeInterface {
    func goToCharactersList()
}

protocol SplashInteractorInterface: InteractorInterface {
}

protocol SplashPresenterInterface: ObservableObject {
    var formatter: SplashFormatter { get }
    func goToCharactersList()
}
