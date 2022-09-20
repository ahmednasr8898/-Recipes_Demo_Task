//
//  IngredientTableViewCell.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    //MARK: - outlet
    @IBOutlet weak var ingredientLabel: UILabel!
    //MARK: - variable
    static let identifier = "IngredientTableViewCell"
    static func Nib()-> UINib{ return UINib(nibName: "IngredientTableViewCell", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func confiegrationCell(ingredientTitle: String){
        ingredientLabel.text = ingredientTitle
    }
}
