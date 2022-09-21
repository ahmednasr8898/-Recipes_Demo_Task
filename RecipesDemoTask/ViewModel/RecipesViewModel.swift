//
//  RecipesViewModel.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation

class RecipesViewModel {
    
    var bindSuccessToView: (()->()) = {}
    var recipeData: RecipeModel!{
        didSet{
            self.bindSuccessToView()
        }
    }
    
    var bindFailedToView: (()->()) = {}
    var error: Error!{
        didSet{
            self.bindFailedToView()
        }
    }
    
    func fetchRecipesData(searchWord: String = "All", from: Int = 0, to: Int = 5){
        Networking.shared.getRecipes(searchWord: searchWord, from: from, to: to) { recipeModel, error in
            if let recipeModel = recipeModel {
                self.recipeData = recipeModel
            }else {
                self.error = error
            }
        }
    }
    
    func fetchRecipesWithFilterData(health: String, searchWord: String = "All", from: Int = 0, to: Int = 5){
        Networking.shared.getRecipesWithFilter(searchWord: searchWord, health: health, from: from, to: to) { recipeModel, error in
            if let recipeModel = recipeModel {
                self.recipeData = recipeModel
            }else {
                self.error = error
            }
        }
    }
}
