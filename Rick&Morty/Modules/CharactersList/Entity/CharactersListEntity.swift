//
//  CharactersListEntity.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

class CharactersListEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var characters: [CharacterEntity]
    @Published var info: InfoEntity
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
        case info
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characters = try container.decode([CharacterEntity].self, forKey: .characters)
        info = try container.decode(InfoEntity.self, forKey: .info)
    }
}

class InfoEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var next: String?
    
    enum CodingKeys: CodingKey {
        case next
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        next = try? container.decode(String.self, forKey: .next)
    }
}
