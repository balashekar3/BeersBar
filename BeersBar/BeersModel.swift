//
//  BeersModel.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 19/02/24.
//

import Foundation
// MARK: - BeersModel
struct BeersModel: Codable {
    let price, name: String
    let rating: Rating
    let image: String
    let id: Int
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double
    let reviews: Int
}
