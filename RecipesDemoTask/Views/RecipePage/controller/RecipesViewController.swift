//
//  ProductsViewController.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 18/09/2022.
//

import UIKit

class RecipesViewController: UIViewController {
    
    //MARK: - search outlet
    @IBOutlet weak var recipeSearchTextField: PaddingTextField!
    @IBOutlet weak var removeSearchWordButton: UIButton!
    //MARK: - search history outlet
    @IBOutlet weak var searchHistoryView: UIView!
    @IBOutlet weak var removeSearchHistoryImageView: UIImageView!
    @IBOutlet weak var searchHistoryTableView: UITableView!
    //MARK: - recipe section outlet
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var noDataFounedImageView: UIImageView!
    //MARK: - vaiable
    var arrOfSearchHistory = Helper.shared.getLatestHistorySearch()
    var arrOfCategories:[(category: String, healthKey: String)] = []
    var arrOfRecipes: [Hit] = []
    let recipesViewModel = RecipesViewModel()
    var searchWord: String = "All"
    var healthKey: String = ""
    var isMore: Bool = true
    var from: Int = 5
    var to: Int = 10
    var selectedIndex = IndexPath(item: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupDesign()
        setCategoryData()
        setupCategoryCollectionView()
        setRecipeData()
        setupRecipeTableView()
        setupSearchHistoryTableView()
        setupSearchRecipesTextField()
        handleTouchDownOnSearchTextField()
        handleTappedOnSearchButton()
        handleValueChangedOnSearchTextField()
        addTappedToRemoveSearchHistoryWords()
        addTappedToHiddenLatestHistorySearchSearch()
    }
    
    private func setupNavigationController() {
        title = "Recipes For You"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func setupDesign() {
        if #available(iOS 13.0, *) {
            removeSearchWordButton.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
            removeSearchHistoryImageView.image = UIImage(systemName: "arrow.uturn.down")
        }
    }
    
    private func setCategoryData() {
        arrOfCategories.append((category: "All", healthKey: "All"))
        arrOfCategories.append((category: "Low Sugar", healthKey: "low-sugar"))
        arrOfCategories.append((category: "Keto", healthKey: "keto-friendly"))
        arrOfCategories.append((category: "Vegan", healthKey: "vegan"))
    }
    
    func showNoDataSearchResult() {
        self.recipesTableView.isHidden = true
        self.noDataFounedImageView.isHidden = false
    }
    
    func showDataSearchResult() {
        self.recipesTableView.isHidden = false
        self.noDataFounedImageView.isHidden = true
    }
    
    
    func showLatestSearchHistory() {
        arrOfSearchHistory = Helper.shared.getLatestHistorySearch()
        reloadSearchHistoryTableView()
        self.searchHistoryView.isHidden = false
    }
    
    func hiddenLatestSearchHistory() {
        view.endEditing(true)
        self.searchHistoryView.isHidden = true
    }
}


