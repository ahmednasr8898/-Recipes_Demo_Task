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
    var from: Int = 0
    var to: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCategoryData()
        setupNavigationController()
        setupSearchBar()
        setupCategoryCollectionView()
        setRecipeData()
        setupTableView()
    }
    
    func setCategoryData(){
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

extension RecipesViewController {
    private func setupNavigationController(){
        title = "Recipes For You"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Search Bar
extension RecipesViewController: UISearchBarDelegate {
    func setupSearchBar(){
        recipesSearchBar.delegate = self
        recipesSearchBar.barTintColor = UIColor.white
        recipesSearchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchWord = "All"
            self.getDataDetecteUserSelected(healthKey: self.healthKey)
        }else{
            searchWord = searchText
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchWord = "All"
        self.getDataDetecteUserSelected(healthKey: self.healthKey)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        self.getDataDetecteUserSelected(healthKey: self.healthKey)
    }
}

