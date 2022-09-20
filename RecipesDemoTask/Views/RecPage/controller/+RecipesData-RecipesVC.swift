//
//  +RecipesData-RecipesVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import Foundation

extension RecipesViewController {
    func setRecipeData(){
        recipesViewModel.fetchRecipesData(searchWord: self.searchWord)
        
        recipesViewModel.bindSuccessToView = {
            guard let recipes = self.recipesViewModel.recipeData, let hits = recipes.hits, !hits.isEmpty else {
                self.showNoData()
                return
            }
            self.showFounedData()
            self.arrOfRecipes = hits
            self.reloadRecipeTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoData()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func setRecipeWithFilterData(health: String){
        recipesViewModel.fetchRecipesWithFilterData(health: health, searchWord: self.searchWord)
        
        recipesViewModel.bindSuccessToView = {
            guard let recipes = self.recipesViewModel.recipeData, let hits = recipes.hits, !hits.isEmpty else {
                self.showNoData()
                return
            }
            self.showFounedData()
            self.arrOfRecipes = hits
            self.reloadRecipeTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoData()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func handleGetData(healthKey: String){
        switch healthKey {
        case "All", "":
            self.setRecipeData()
        default:
            self.setRecipeWithFilterData(health: healthKey)
        }
    }
}
