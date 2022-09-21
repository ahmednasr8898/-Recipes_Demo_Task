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

//MARK: - number of table view cell
extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case searchHistoryTableView:
            tableView.checkIfNoDataFounded(countOfData: self.arrOfSearchHistory.count)
            return arrOfSearchHistory.count
            
        default :
            return arrOfRecipes.count
        }
    }
}
    
//MARK: - set up cell of table view
extension RecipesViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case searchHistoryTableView:
            let searchHistoryCell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as! IngredientTableViewCell
            searchHistoryCell.ingredientLabel.text = arrOfSearchHistory[indexPath.row]
            return searchHistoryCell
            
        default :
            let recipeCell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as! RecipeTableViewCell
            guard let recipe = arrOfRecipes[indexPath.row].recipe else {return UITableViewCell()}
            recipeCell.confiegrationCell(recipe: recipe)
            return recipeCell
        }
    }
}

//MARK: - height of table view cell
extension RecipesViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case searchHistoryTableView:
            return 40
            
        default :
            return 150
        }
    }
}
    
//MARK: - header of table view cell
extension RecipesViewController {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case searchHistoryTableView:
            return "Latest search results"
            
        default :
            return ""
        }
    }
}
//MARK: - selected and deSelected item of table view
extension RecipesViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case searchHistoryTableView:
            self.recipeSearchTextField.text = self.arrOfSearchHistory[indexPath.row]
            self.removeSearchWordButton.isHidden = false
            
        default :
            view.endEditing(true)
            guard let recipe = arrOfRecipes[indexPath.row].recipe else {return}
            MovingTo.productDetails(on: self, recipe: recipe)
        }
    }
}
