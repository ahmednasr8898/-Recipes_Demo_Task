//
//  ProductDetailsViewController.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit
import Kingfisher

class RecipeDetailsViewController: UIViewController {

    //MARK: - outlet
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var openSiteButton: UIButton!
    //MARK: - variable
    var recipe: Recipe?
    var arrOfIngredient: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        addShareBarButtonItem()
        setupDesign()
        setRecipeImageView()
        setRecipeTitle()
        setIngredientData()
        setupIngredientTableView()
    }
    
    @IBAction func didPressedOnOpenSiteButton(_ sender: UIView) {
        sender.animationWithView()
        openRecipeUrlInWeb()
    }
    
    private func openRecipeUrlInWeb(){
        guard let recipeUrl = recipe?.url else {return}
        UIApplication.shared.open(URL(string: recipeUrl)! as URL, options: [:], completionHandler: nil)
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.tintColor = AppColors.tomato
    }
    
    private func addShareBarButtonItem(){
        let share = UIBarButtonItem(image: AppImages.shareImage, style: .done, target: self, action: #selector(shareRecipe))
        navigationItem.rightBarButtonItem = share
    }
    
    @objc private func shareRecipe(){
        guard let recipeUrl = recipe?.url, let recipeImage = recipeImageView.image else {return}
        let shareSheet = UIActivityViewController(activityItems: [recipeUrl, recipeImage], applicationActivities: nil)
        shareSheet.popoverPresentationController?.sourceView = view
        shareSheet.popoverPresentationController?.sourceRect = view.frame
        present(shareSheet, animated: true)
    }
    
    private func setupDesign() {
        subView.layer.cornerRadius = 40
        subView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        openSiteButton.layer.cornerRadius = 12
    }

    private func setRecipeImageView() {
        self.recipeImageView.kf.indicatorType = .activity
        guard let imageName = recipe?.image else {return}
        self.recipeImageView.kf.setImage(with: URL(string: imageName))
    }
    
    private func setRecipeTitle() {
        self.recipeTitleLabel.text = recipe?.label
    }
    
    private func setIngredientData() {
        guard let ingredient = recipe?.ingredientLines, !ingredient.isEmpty else {return}
        arrOfIngredient = ingredient
    }
    
    private func setupIngredientTableView() {
        self.ingredientTableView.register(IngredientTableViewCell.Nib(), forCellReuseIdentifier: IngredientTableViewCell.identifier)
        self.ingredientTableView.delegate = self
        self.ingredientTableView.dataSource = self
        self.ingredientTableView.rowHeight = 80
    }
}

extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfIngredient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as! IngredientTableViewCell
        
        let ingredientTitle = arrOfIngredient[indexPath.row]
        cell.confiegrationCell(ingredientTitle: ingredientTitle)
        return cell
    }
}
