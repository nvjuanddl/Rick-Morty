//
//  CharactersListView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import SwiftUI

struct CharactersListView: View {
    
    // MARK: - Public methods -
    
    @ObservedObject var presenter: CharactersListPresenter
    
    var body: some View {
        HeaderSearchView(delegate: self)
        GridView(delegate: self) {
            ForEach(presenter.items, id: \.id) { item in
                GridCellView(element: item)
                    .task {
                        if item == self.presenter.last, hasNext(), !isSearching {
                            presenter.getCharactersList()
                        }
                    }
                    .onTapGesture {
                        presenter.goToCharactersDetail(item: item)
                    }
            }
        }
    }
}

// MARK: - SearchDelegate -

extension CharactersListView: SearchDelegate {
    
    var placeHolder: String { return "Find your favorite" }
    
    func search(query: String) {
        presenter.search(query: query)
    }
}

// MARK: - GridViewDelegate -

extension CharactersListView: GridViewDelegate {
    
    var isSearching: Bool {
        presenter.isSearching
    }
    
    func more() {
        presenter.getCharactersList()
    }
    
    func hasNext() -> Bool {
        return presenter.hasNext()
    }
}
