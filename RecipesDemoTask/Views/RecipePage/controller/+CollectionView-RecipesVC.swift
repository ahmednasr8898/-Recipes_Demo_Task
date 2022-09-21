//
//  +CollectionView-RecipesVC.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit


//MARK: - setup collection view
extension RecipesViewController {
    func setupCategoryCollectionView(){
        self.categoryCollectionView.register(RecipesCategoryCollectionViewCell.Nib(), forCellWithReuseIdentifier: RecipesCategoryCollectionViewCell.identifier)
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
    }
}

//MARK: - number of collection view cell
extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfCategories.count
    }
}
    
//MARK: - set up cell of collection view
extension RecipesViewController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesCategoryCollectionViewCell.identifier, for: indexPath)
        as! RecipesCategoryCollectionViewCell
        if selectedIndex.item == indexPath.item {
            cell.categoryTitleLabel.textColor = AppColors.tomato
        }
        let categoryTitle = arrOfCategories[indexPath.row].category
        cell.categoryTitleLabel.text = categoryTitle
        return cell
    }
}

//MARK: - selected and deSelected item of collection view
extension RecipesViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RecipesCategoryCollectionViewCell
        cell.categoryTitleLabel.textColor = AppColors.tomato
        self.healthKey = arrOfCategories[indexPath.row].healthKey
        self.from = 5
        self.to = 10
        self.handleGetData(healthKey: self.healthKey)
        if self.selectedIndex.item != -1 {
            if  let firstCell = collectionView.cellForItem(at: selectedIndex) as? RecipesCategoryCollectionViewCell {
                firstCell.categoryTitleLabel.textColor = AppColors.systemColor
                self.selectedIndex = [-1,-1]
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RecipesCategoryCollectionViewCell
        cell.categoryTitleLabel.textColor = AppColors.systemColor
    }
    
}

//MARK: - set up size of collection view cell
extension RecipesViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = arrOfCategories[indexPath.row].category
        label.sizeToFit()
        return CGSize(width: label.frame.width + 18, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}

