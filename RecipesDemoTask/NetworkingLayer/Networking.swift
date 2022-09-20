//
//  Networking.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation
import Alamofire

class Networking {
    
    func getRecipes(searchWord: String, from: Int, to: Int, complition: @escaping (RecipeModel?, Error?)->Void) {
        guard let url = URLs.shared.recipesURL(searchWord: searchWord, from: from, to: to) else {return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { res in
            switch res.result{
            case .failure(let error):
                complition(nil, error)
            case .success(_):
                guard let data = res.data else { return }
                do{
                    let json = try JSONDecoder().decode(RecipeModel.self, from: data)
                    complition(json, nil)
                }catch let error{
                    complition(nil, error)
                }
            }
        }
    }
    
    func getRecipesWithFilter(searchWord: String, health: String, from: Int, to: Int, complition: @escaping (RecipeModel?, Error?)->Void){
        guard let url = URLs.shared.recipesWithFilterURL(searchWord: searchWord, health: health, from: from, to: to) else {return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { res in
            switch res.result{
            case .failure(let error):
                complition(nil, error)
            case .success(_):
                guard let data = res.data else { return }
                do{
                    let json = try JSONDecoder().decode(RecipeModel.self, from: data)
                    complition(json, nil)
                }catch let error{
                    complition(nil, error)
                }
            }
        }
    }
}
