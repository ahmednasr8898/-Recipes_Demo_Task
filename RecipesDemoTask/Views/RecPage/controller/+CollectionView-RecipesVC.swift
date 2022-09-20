//
//  +CollectionView-RecipesVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit


//MARK: - setup table view
extension RecipesViewController {
    func setupCategoryCollectionView(){
        self.categoryCollectionView.register(RecipesCategoryCollectionViewCell.Nib(), forCellWithReuseIdentifier: RecipesCategoryCollectionViewCell.identifier)
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
    }
}

//MARK: - setup table view
extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesCategoryCollectionViewCell.identifier, for: indexPath)
        as! RecipesCategoryCollectionViewCell
        let categoryTitle = categories[indexPath.row].category
        cell.categoryTitleLabel.text = categoryTitle
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RecipesCategoryCollectionViewCell
        cell.categoryTitleLabel.textColor = AppColors.tomato
        self.healthKey = categories[indexPath.row].healthKey
        self.from = 5
        self.to = 10
        self.handleGetData(healthKey: self.healthKey)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RecipesCategoryCollectionViewCell
        cell.categoryTitleLabel.textColor = AppColors.systemColor
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = categories[indexPath.row].category
        label.sizeToFit()
        return CGSize(width: label.frame.width + 24, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}

