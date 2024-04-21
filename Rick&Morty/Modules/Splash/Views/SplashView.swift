//
//  SplashView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import SwiftUI

struct SplashView: View {
    
    struct Constants {
        static let spacing: CGFloat = 10
    }
    
    // MARK: - Public methods -
    
    @ObservedObject var presenter: SplashPresenter
    
    var body: some View {
        Spacer()
        VStack(spacing: Constants.spacing) {
            Text(presenter.formatter.fullName)
            Text(presenter.formatter.email)
            Text(presenter.formatter.created)
        }
        .padding(.vertical, .zero)
        .padding(.horizontal, .zero)
        Spacer()
        Button("Continuar") {
            presenter.goToCharactersList()
        }
    }
}
