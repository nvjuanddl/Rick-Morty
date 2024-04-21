//
//  CharactersListRequest.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

struct CharactersListRequest: Request {
    typealias Output = CharactersListEntity
    
    var url: URL
    var method: HTTPMethod { .get }
    
    init(urlString: String?) {
        if let urlString, let url = URL(string: urlString) {
            self.url = url
        } else {
            self.url = URL(string: "https://rickandmortyapi.com/api/character")!
        }
    }
}
