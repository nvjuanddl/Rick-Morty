//
//  CharacterAdapter.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

extension CharacterEntity: GridCellProtocol {
    var identifier: String { String(format: "%03d", id) }
    var headline: String { name.capitalized }
    var imageURL: URL? { URL(string: image) }
    var colorName: String? { nil }
    var typesList: [(icon: String, name: String)] { [] }
}
