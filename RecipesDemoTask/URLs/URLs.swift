//
//  URLs.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation


struct URLs {
    
    private init() { }
    
    static let shared = URLs()
    
    private let baseURL = "https://api.edamam.com/"

    func recipesURL(searchWord: String, from: Int, to: Int)-> URL? {
        return URL(string: baseURL + "search?q=\(searchWord)&app_id=\(NetworkingInfo.app_id)&app_key=\(NetworkingInfo.app_key)&from=\(from)&to=\(to)")
    }
    
    func recipesWithFilterURL(searchWord: String, health: String, from: Int, to: Int)-> URL? {
        return URL(string: baseURL + "search?q=\(searchWord)&health=\(health)&app_id=\(NetworkingInfo.app_id)&app_key=\(NetworkingInfo.app_key)&from=\(from)&to=\(to)")
    }
}
