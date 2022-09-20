//
//  re.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation

// MARK: - RecipeModel
struct RecipeModel: Codable {
    let q: String?
    let from, to: Int?
    let more: Bool?
    let count: Int?
    let hits: [Hit]?
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe?
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String?
    let label: String?
    let image: String?
    let source: String?
    let url: String?
    let healthLabels, ingredientLines: [String]?
}
