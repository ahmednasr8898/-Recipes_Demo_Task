//
//  +Search-RecipeVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

//MARK: - add taped on search bar
extension RecipesViewController{
    func addTapedOnSearchBar(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(didPressedOnSearchbar))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        recipesSearchBar.isUserInteractionEnabled = true
        recipesSearchBar.addGestureRecognizer(tap)
    }
    
    @objc func didPressedOnSearchbar(){
        print("celiendd")
        self.searchHistoryView.isHidden = false
    }
}

//MARK: - Search Bar
extension RecipesViewController: UISearchBarDelegate {
     func setupSearchBar(){
        recipesSearchBar.delegate = self
        recipesSearchBar.barTintColor = UIColor.white
        recipesSearchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchHistoryView.isHidden = false
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchHistoryView.isHidden = false
        if searchText == "" {
            searchWord = "All"
            self.handleGetData(healthKey: self.healthKey)
        }else{
            searchWord = searchText
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchHistoryView.isHidden = true
        self.searchWord = "All"
        self.handleGetData(healthKey: self.healthKey)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchHistoryView.isHidden = true
        view.endEditing(true)
        guard let searchWord = searchBar.text, !searchWord.isEmpty else {
            Toast.show(on: self, message: "please write word to search")
            return
        }
        self.searchWord = searchWord
        self.handleGetData(healthKey: self.healthKey)
    }
}


