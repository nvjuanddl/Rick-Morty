//
//  SplashInteractor.swift
//  RickAndMorty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Combine
import Foundation

final class SplashInteractor {
    
    // MARK: - Private properties -
    
    private var networker: Networking
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle -
    
    init(networker: Networking) {
        self.networker = networker
    }
}

// MARK: - SplashInteractorInterface -

extension SplashInteractor: SplashInteractorInterface {
    
}
