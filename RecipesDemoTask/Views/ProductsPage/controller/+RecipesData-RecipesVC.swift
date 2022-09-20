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
            self.isMore = recipes.more ?? false
            self.from = recipes.to ?? 0
            self.to += 5
            self.showFounedData()
            self.arrOfRecipes = hits
            self.reloadTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoData()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController{
    func setRecipesWithPagination(){
        recipesViewModel.fetchRecipesData(searchWord: self.searchWord, from: self.from, to: self.to)
        
        recipesViewModel.bindSuccessToView = {
            guard let recipes = self.recipesViewModel.recipeData.hits else { return }
            self.isMore = self.recipesViewModel.recipeData.more ?? false
            self.from = self.recipesViewModel.recipeData.to ?? 0
            self.to += 5
            for recipe in recipes {
                self.arrOfRecipes.append(recipe)
            }
            self.reloadTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func setRecipeWithFilterData(health: String){
        recipesViewModel.fetchRecipesWithFilterData(health: health, searchWord: self.searchWord, from: self.from, to: self.to)
        
        recipesViewModel.bindSuccessToView = {
            guard let recipes = self.recipesViewModel.recipeData, let hits = recipes.hits, !hits.isEmpty else {
                self.showNoData()
                return
            }
            self.isMore = recipes.more ?? false
            self.from = recipes.to ?? 0
            self.to += 5
            self.showFounedData()
            self.arrOfRecipes = hits
            self.reloadTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoData()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func setRecipeWithFilterWithPaginationData(health: String){
        recipesViewModel.fetchRecipesWithFilterData(health: health, searchWord: self.searchWord, from: self.from, to: self.to)
        
        recipesViewModel.bindSuccessToView = {
            guard let recipes = self.recipesViewModel.recipeData.hits else { return }
            self.isMore = self.recipesViewModel.recipeData.more ?? false
            self.from = self.recipesViewModel.recipeData.to ?? 0
            self.to += 5
            for recipe in recipes {
                self.arrOfRecipes.append(recipe)
            }
            self.reloadTableView()
        }
        
    }
}

extension RecipesViewController {
    func getDataDetecteUserSelected(healthKey: String){
        switch healthKey {
        case "All", "":
            self.setRecipeData()
        default:
            self.setRecipeWithFilterData(health: healthKey)
        }
    }
}

extension RecipesViewController {
    func getDataWithPaginationDetecteUserSelected(healthKey: String){
        switch healthKey {
        case "All", "":
            self.setRecipesWithPagination()
        default:
            self.setRecipeWithFilterWithPaginationData(health: healthKey)
        }
    }
}
