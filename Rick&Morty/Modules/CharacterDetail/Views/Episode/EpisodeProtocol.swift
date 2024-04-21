//
//  EpisodeProtocol.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 22/01/24.
//

import Foundation

protocol EpisodeProtocol {
    var headline: String { get }
    var reference: String { get }
}

extension EpisodeEntity: EpisodeProtocol {
    
    var headline: String { name }
    var reference: String { code }
}
