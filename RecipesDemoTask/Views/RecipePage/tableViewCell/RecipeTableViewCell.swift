//
//  RecipeTableViewCell.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {

    //MARK: - outlet
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeCaloriesLabel: UILabel!
    //MARK: - variable
    static let identifier = "RecipeTableViewCell"
    static func Nib()-> UINib{ return UINib(nibName: "RecipeTableViewCell", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupRecipeImageView()
    }
    
    func confiegrationCell(recipe: Recipe){
        recipeTitleLabel.text = recipe.label
        recipeSourceLabel.text = recipe.source
        recipeCaloriesLabel.text = "\(recipe.calories ?? 0.0) cal"
        recipeImageView.kf.indicatorType = .activity
        guard let imageNamed = recipe.image else {return}
        recipeImageView.kf.setImage(with: URL(string: imageNamed))
    }
    
    private func setupRecipeImageView(){
        recipeImageView.layer.cornerRadius = 10
        recipeImageView.layer.borderColor = AppColors.tomato.cgColor
        recipeImageView.layer.borderWidth = 0.2
    }
}
