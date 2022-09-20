//
//  RecipesCategoryCollectionViewCell.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit

class RecipesCategoryCollectionViewCell: UICollectionViewCell {

    //MARK: - outlet
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    //MARK: - variable
    static let identifier = "RecipesCategoryCollectionViewCell"
    static func Nib()-> UINib{ return UINib(nibName: "RecipesCategoryCollectionViewCell", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesignForCell()
    }
    
    private func setupDesignForCell(){
    }
    
}
