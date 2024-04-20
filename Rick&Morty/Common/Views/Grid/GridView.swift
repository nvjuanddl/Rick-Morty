//
//  GridView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import SwiftUI

protocol GridViewDelegate {
    var isSearching: Bool { get }
    func more()
    func hasNext() -> Bool
}

struct GridView<Content>: View where Content: View {
    
    // MARK: - Private properties -
    
    private let columns = [ GridItem(.adaptive(minimum: 160)) ]
    
    // MARK: - Public properties -
    
    let delegate: GridViewDelegate
    let content: () -> Content
    
    var body: some View {
        VStack {
            gridView()
        }
        .background(.white)
    }
    
    // MARK: - Private methods -
    
    private func waiting() -> some View {
        VStack(alignment: .center) {
            ActivityIndicator(size: 55, color: .red, velocity: 7.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func gridView() -> some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    self.content()
                }
                .padding([.horizontal, .bottom])
                
                if delegate.hasNext(), !delegate.isSearching {
                    ActivityIndicator(size: 45, color: .yellow)
                }
            }
        }
        .padding(.top)
    }
}
