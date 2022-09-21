//
//  +Pagination-RecipeVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import Foundation
import UIKit


extension RecipesViewController {
    func setRecipeWithPaginationData(){
        recipesTableView.setSpinnerFooter(spinner: self.view.createFooterSpinner())
        recipesViewModel.fetchRecipesData(searchWord: self.searchWord, from: self.from, to: self.to)
        
        recipesViewModel.bindSuccessToView = {
            self.recipesTableView.removeFooter()
            guard let recipes = self.recipesViewModel.recipeData.hits, !recipes.isEmpty else {
                DispatchQueue.main.async {
                    self.recipesTableView.tableFooterView = self.view.createFooterNoMoreData()
                }
                return
            }
            
            
            for recipe in recipes {
                self.arrOfRecipes.append(recipe)
            }
            self.isMore = self.recipesViewModel.recipeData.more ?? false
            self.from = (self.recipesViewModel.recipeData.from ?? 0) + 5
            self.to = (self.recipesViewModel.recipeData.to ?? 0) + 5
            self.reloadRecipeTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoDataSearchResult()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func setRecipeWithFilterPaginationData(health: String){
        recipesTableView.setSpinnerFooter(spinner: self.view.createFooterSpinner())
        recipesViewModel.fetchRecipesWithFilterData(health: health, searchWord: self.searchWord, from: self.from, to: self.to)
        
        recipesViewModel.bindSuccessToView = {
            self.recipesTableView.removeFooter()
            guard let recipes = self.recipesViewModel.recipeData.hits, !recipes.isEmpty else {
                DispatchQueue.main.async {
                    self.recipesTableView.tableFooterView = self.view.createFooterNoMoreData()
                }
                return
            }
            
            for recipe in recipes {
                self.arrOfRecipes.append(recipe)
            }
            self.isMore = self.recipesViewModel.recipeData.more ?? false
            self.from = (self.recipesViewModel.recipeData.from ?? 0) + 5
            self.to = (self.recipesViewModel.recipeData.to ?? 0) + 5
            self.reloadRecipeTableView()
        }
        
        recipesViewModel.bindFailedToView = {
            self.showNoDataSearchResult()
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}

extension RecipesViewController {
    func handleGetDataWithPagination(healthKey: String){
        switch healthKey {
        case "All", "":
            self.setRecipeWithPaginationData()
        default:
            self.setRecipeWithFilterPaginationData(health: self.healthKey)
        }
    }
}


//MARK: - pagnation
extension RecipesViewController{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        view.endEditing(true)
        if scrollView == self.recipesTableView {
            if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height{
                if isMore {
                    handleGetDataWithPagination(healthKey: self.healthKey)
                }
            }
        }
    }
}
