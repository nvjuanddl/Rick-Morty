//
//  EpisodeEntity.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

class EpisodeEntity: Identifiable, ObservableObject, Decodable {
    
    @Published var id: Int
    @Published var name: String
    @Published var code: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code = "episode"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode(String.self, forKey: .code)
    }
}

extension EpisodeEntity: Equatable {
    
    static func == (lhs: EpisodeEntity, rhs: EpisodeEntity) -> Bool {
        lhs.id == rhs.id
    }
}
