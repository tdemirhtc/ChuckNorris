//
//  JokesModel.swift
//  JokesApi
//
//  Created by Hatice Taşdemir on 17.11.2024.
//

import Foundation
struct Model: Identifiable, Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String
}
