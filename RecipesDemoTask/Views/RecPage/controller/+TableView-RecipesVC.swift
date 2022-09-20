//
//  +TableView-RecipesVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit

//MARK: - reload recipe table view
extension RecipesViewController {
    func reloadRecipeTableView(){
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
    }
}

//MARK: - reload search history table view
extension RecipesViewController {
    func reloadSearchHistoryTableView(){
        DispatchQueue.main.async {
            self.searchHistoryTableView.reloadData()
        }
    }
}

//MARK: - set up recipe table view
extension RecipesViewController {
    func setupRecipeTableView(){
        self.recipesTableView.register(RecipeTableViewCell.Nib(), forCellReuseIdentifier: RecipeTableViewCell.identifier)
        self.recipesTableView.delegate = self
        self.recipesTableView.dataSource = self
    }
}

//MARK: - set up search history table view
extension RecipesViewController {
    func setupSearchHistoryTableView(){
        self.searchHistoryTableView.register(IngredientTableViewCell.Nib(), forCellReuseIdentifier: IngredientTableViewCell.identifier)
        self.searchHistoryTableView.delegate = self
        self.searchHistoryTableView.dataSource = self
    }
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case searchHistoryTableView:
            return searchHistory.count
        default :
            return arrOfRecipes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case searchHistoryTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as! IngredientTableViewCell
            cell.ingredientLabel.text = searchHistory[indexPath.row]
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as! RecipeTableViewCell
            guard let recipe = arrOfRecipes[indexPath.row].recipe else {return UITableViewCell()}
            cell.confiegrationCell(recipe: recipe)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case searchHistoryTableView:
            return 40
        default :
            return 150
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case searchHistoryTableView:
            return "Latest search results"
        default :
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case searchHistoryTableView:
            self.recipesSearchBar.text = self.searchHistory[indexPath.row]
        default :
            guard let recipe = arrOfRecipes[indexPath.row].recipe else {return}
            MovingTo.productDetails(on: self, recipe: recipe)
        }
    }
}
