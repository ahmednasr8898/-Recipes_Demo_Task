//
//  +TableView-RecipesVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit

//MARK: - reload table view
extension RecipesViewController {
    func reloadTableView(){
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
    }
}

//MARK: - set up table view
extension RecipesViewController {
    func setupTableView(){
        self.recipesTableView.register(RecipeTableViewCell.Nib(), forCellReuseIdentifier: RecipeTableViewCell.identifier)
        self.recipesTableView.delegate = self
        self.recipesTableView.dataSource = self
    }
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as! RecipeTableViewCell
        guard let recipe = arrOfRecipes[indexPath.row].recipe else {return UITableViewCell()}
        cell.confiegrationCell(recipe: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = arrOfRecipes[indexPath.row].recipe else {return}
        MovingTo.productDetails(on: self, recipe: recipe)
    }
}

//MARK: - Pagination when scrolling
extension RecipesViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (recipesTableView.contentSize.height-100-scrollView.frame.size.height) {
            if isMore {
                self.getDataWithPaginationDetecteUserSelected(healthKey: self.healthKey)
            }
        }
    }
}
