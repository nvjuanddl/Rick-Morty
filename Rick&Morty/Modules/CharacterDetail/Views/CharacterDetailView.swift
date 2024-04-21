//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var presenter: CharacterDetailPresenter
    
    var body: some View {
        VStack {
            navigationHeader
            List {
                name
                image
                info
                episodes
            }
            .listStyle(.plain)
        }
    }
    
    @ViewBuilder var navigationHeader: some View {
        Button(action: presenter.goBack) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.black)
    }
    
    @ViewBuilder var name: some View {
        HStack {
            Text(presenter.item.headline)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: .zero, trailing: .zero))
            Spacer()
            Text("#\(presenter.item.identifier)")
                .padding(EdgeInsets(top: 10, leading: .zero, bottom: .zero, trailing: 10))
        }
        .foregroundColor(.black)
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder var image: some View {
        AsyncImage(url: presenter.item.imageURL) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(maxWidth: .infinity)
            } else if phase.error != nil {
                Image(systemName: Constants.defaultImageAlternative)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 120, alignment: .center)
                    .tint(.white)
            } else {
                ActivityIndicator(size: 45, color: .red)
            }
        }
    }
    
    @ViewBuilder var info: some View {
        let character = presenter.item
        VStack(alignment: .leading, spacing: 16) {
            Text("Info")
                .font(.title)
                .foregroundColor(.black)
                .padding(.leading, 8)
            VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "creditcard")

                    Text(character.name)
                        .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "person.fill.questionmark")
                    
                    Text(character.species)
                        .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }
                
                if !character.type.isEmpty {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "person.fill.viewfinder")
                        
                        Text(character.type)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "person.and.arrow.left.and.arrow.right")
                    
                    Text(character.gender)
                        .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }
                
                if !character.origin.isEmpty {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "globe")
                        
                        Text(character.origin)
                            .multilineTextAlignment(.leading)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                
                if !character.location.isEmpty {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "eyes")
                        
                        Text(character.location)
                            .multilineTextAlignment(.leading)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
            }
            .font(.subheadline)
        }
        .padding(.horizontal, 8)
    }
    
    @ViewBuilder var episodes: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Episodes")
                .font(.title)
                .foregroundColor(.black)
                .padding(.leading, 8)

            VStack(spacing: 8) {
                ForEach(presenter.episodesList) { episode in
                    EpisodeView(episode: episode)
                }
            }
        }
    }
}

