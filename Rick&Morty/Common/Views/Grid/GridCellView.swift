//
//  GridCellView.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import SwiftUI

struct GridCellView: View {
    
    // MARK: - Public properties -
    
    let element: GridCellProtocol
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            VStack(spacing: 5) {
                HStack(spacing: 5) {
                    Text(element.headline)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: .zero, trailing: .zero))
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("#\(element.identifier)")
                        .padding(EdgeInsets(top: 10, leading: .zero, bottom: .zero, trailing: 10))
                        .lineLimit(1)
                        
                }
                .foregroundColor(.white)
                .font(.subheadline)
                .frame(maxWidth: .infinity)
                
                
                AsyncImage(url: element.imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 60, height: 60, alignment: .trailing)
                    } else if phase.error != nil {
                        Image(systemName: Constants.defaultImageAlternative)
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 60, height: 60, alignment: .trailing)
                            .tint(.white)
                    } else {
                        ActivityIndicator(size: 60, color: .red)
                    }
                }.padding(EdgeInsets(top: .zero, leading: 10, bottom: 10, trailing: 10))
                
            }
            .cornerRadius(10)
        }
    }
}
