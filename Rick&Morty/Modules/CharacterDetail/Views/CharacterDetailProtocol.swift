//
//  CharacterDetailProtocol.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

protocol CharacterDetailProtocol {
    var identifier: String { get }
    var headline: String { get }
    var imageURL: URL? { get }
    var colorName: String? { get }
    var episodes: [String] { get }
    var species: String { get }
    var type: String { get }
    var gender: String { get }
}

extension CharacterEntity: CharacterDetailProtocol {
    var episodes: [String] { episode }
}

