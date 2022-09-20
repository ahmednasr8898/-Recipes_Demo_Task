//
//  ProductsViewController.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 18/09/2022.
//

import UIKit

class RecipesViewController: UIViewController {
    
    //MARK: - outlet
    @IBOutlet weak var recipesSearchBar: UISearchBar!
    @IBOutlet weak var searchHistoryView: UIView!
    @IBOutlet weak var searchHistoryTableView: UITableView!
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var noDataFounedImageView: UIImageView!
    //MARK: - vaiable
    var categories:[(category: String, healthKey: String)] = []
    let recipesViewModel = RecipesViewModel()
    var arrOfRecipes: [Hit] = []
    var healthKey: String = ""
    var searchWord: String = "All"
    var isMore: Bool = true
    var from: Int = 5
    var to: Int = 10
    
    let searchHistory = ["Al", "a", "awe", "ewewe", "qwqwqw", "sasas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setCategoryData()
        setupSearchBar()
        addTapedOnSearchBar()
        setupCategoryCollectionView()
        setRecipeData()
        setupRecipeTableView()
        setupSearchHistoryTableView()
    }
    
    private func setupNavigationController(){
        title = "Recipes For You"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setCategoryData(){
        categories.append((category: "All", healthKey: "All"))
        categories.append((category: "Low Sugar", healthKey: "low-sugar"))
        categories.append((category: "Keto", healthKey: "keto-friendly"))
        categories.append((category: "Vegan", healthKey: "vegan"))
    }
    
    func showNoData(){
        self.recipesTableView.isHidden = true
        self.noDataFounedImageView.isHidden = false
    }
    
    func showFounedData(){
        self.recipesTableView.isHidden = false
        self.noDataFounedImageView.isHidden = true
    }
}



