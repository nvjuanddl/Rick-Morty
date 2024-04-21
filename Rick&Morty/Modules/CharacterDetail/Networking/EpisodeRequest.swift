//
//  EpisodesRequest.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

struct EpisodeRequest: Request {
    typealias Output = EpisodeEntity
    
    var url: URL
    var method: HTTPMethod { .get }
    
    init(urlString: String) {
        self.url = URL(string: urlString)!
    }
}
