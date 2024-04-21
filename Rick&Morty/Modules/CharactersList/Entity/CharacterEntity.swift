//
//  CharacterEntity.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

class CharacterEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var name: String
    @Published var image: String
    @Published var id: Int
    @Published var episode: [String]
    @Published var species: String
    @Published var type: String
    @Published var gender: String
    @Published var origin: String
    @Published var location: String
    
    enum CodingKeys: CodingKey {
        case name
        case image
        case id
        case episode
        case species
        case type
        case gender
        case origin
        case location
    }
    
    enum OriginCodingKeys: CodingKey {
        case name
    }
    
    enum LocationCodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let originContainer = try container.nestedContainer(keyedBy: OriginCodingKeys.self, forKey: .origin)
        let locationContainer = try container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        image = try container.decode(String.self, forKey: .image)
        episode = try container.decode([String].self, forKey: .episode)
        species = try container.decode(String.self, forKey: .species)
        type = try container.decode(String.self, forKey: .type)
        gender = try container.decode(String.self, forKey: .gender)
        origin = try originContainer.decode(String.self, forKey: .name)
        location = try locationContainer.decode(String.self, forKey: .name)
    }
}

extension CharacterEntity: Equatable {
    
    static func == (lhs: CharacterEntity, rhs: CharacterEntity) -> Bool {
        lhs.id == rhs.id
    }
}

