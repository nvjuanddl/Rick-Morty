//
//  GridCellProtocol.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import Foundation

protocol GridCellProtocol {
    var identifier: String { get }
    var headline: String { get }
    var imageURL: URL? { get }
}
