//
//  EpisodeView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 22/01/24.
//

import SwiftUI

struct EpisodeView: View {
    let episode: EpisodeProtocol

    var body: some View {
        HStack(spacing: 16) {
            Text(episode.headline)
                .multilineTextAlignment(.leading)

            Spacer()

            Text(episode.reference)
        }
        .font(.subheadline)
        .foregroundColor(.white)
        .padding(16)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
