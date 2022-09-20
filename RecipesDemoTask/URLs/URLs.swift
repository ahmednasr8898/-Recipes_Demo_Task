//
//  URLs.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation


struct URLs {
    static let shared = URLs()
    let baseURL = "https://api.edamam.com/"
    let app_id = "364ffa3d"
    let app_key = "cfc6a3577745554855dbc3eaa508f050"
    
    func recipesURL(searchWord: String, from: Int, to: Int)-> URL? {
        return URL(string: baseURL + "search?q=\(searchWord)&app_id=\(app_id)&app_key=\(app_key)&from=\(from)&to=\(to)")
    }
    
    func recipesWithFilterURL(searchWord: String, health: String, from: Int, to: Int)-> URL? {
        return URL(string: baseURL + "search?q=\(searchWord)&health=\(health)&app_id=\(app_id)&app_key=\(app_key)&from=\(from)&to=\(to)")
    }
}
