//
//  +Search-RecipeVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

//MARK: - set up design for search text field
extension RecipesViewController {
    func setupSearchRecipesTextField() {
        recipeSearchTextField.layer.cornerRadius = 8
        recipeSearchTextField.layer.borderWidth = 0.8
        recipeSearchTextField.layer.borderColor = UIColor.darkGray.cgColor
        if #available(iOS 13.0, *) {
            guard let searchImage = UIImage(systemName: "magnifyingglass") else {return}
            recipeSearchTextField.setIcon(searchImage)
        }
    }
}

//MARK: - touch down in text field (show latest search history)
extension RecipesViewController {
    func handleTouchDownOnSearchTextField() {
        recipeSearchTextField.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
    }
    
    @objc func touchDown(_ textField:UITextField) {
        self.showLatestSearchHistory()
    }
}

//MARK: - touch in search word in keyboard (show search result)
extension RecipesViewController {
    func handleTappedOnSearchButton() {
        recipeSearchTextField.addTarget(self, action: #selector(primaryActionTriggered(_:)), for: .primaryActionTriggered)
    }
    
    @objc private func primaryActionTriggered(_ textField:UITextField) {
        self.hiddenLatestSearchHistory()
        view.endEditing(true)
        guard let searchWord = recipeSearchTextField.text, !searchWord.isEmpty else {
            Toast.show(on: self, message: "please write word to search")
            return
        }
        Helper.shared.saveLatestHistorySearch(historySearchWord: searchWord)
        self.searchWord = searchWord
        self.handleGetData(healthKey: self.healthKey)
    }
}

//MARK: - touch in search word in keyboard (show search result)
extension RecipesViewController {
    func handleValueChangedOnSearchTextField() {
        recipeSearchTextField.addTarget(self, action: #selector(valueChanged(_:)), for: .editingChanged)
    }
    
    @objc private func valueChanged(_ textField:UITextField) {
        if recipeSearchTextField.text?.count == 0 {
            ifSearchTextFieldIsEmpty()
        }else{
            ifSearchTextFieldHasWord()
        }
    }
    
    private func ifSearchTextFieldIsEmpty() {
        self.removeSearchWordButton.isHidden = true
        searchWord = "All"
        self.handleGetData(healthKey: self.healthKey)
    }
    
    private func ifSearchTextFieldHasWord() {
        self.removeSearchWordButton.isHidden = false
        searchWord = recipeSearchTextField.text ?? ""
    }
}

//MARK: - add tapped to remove search words
extension RecipesViewController {
    func addTappedToRemoveSearchHistoryWords() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeSearchWords))
        removeSearchWordButton.isUserInteractionEnabled =  true
        removeSearchWordButton.addGestureRecognizer(tap)
    }
    
    @objc private func removeSearchWords(){
        self.removeSearchWordButton.isHidden = true
        self.recipeSearchTextField.text = ""
        self.hiddenLatestSearchHistory()
        self.searchWord = "All"
        self.handleGetData(healthKey: self.healthKey)
    }
}


//MARK: - add tapped to hidden latest search
extension RecipesViewController {
    func addTappedToHiddenLatestHistorySearchSearch() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hiddenLatestHitorySearch))
        removeSearchHistoryImageView.isUserInteractionEnabled =  true
        removeSearchHistoryImageView.addGestureRecognizer(tap)
    }
    
    @objc private func hiddenLatestHitorySearch(){
        hiddenLatestSearchHistory()
    }
}
