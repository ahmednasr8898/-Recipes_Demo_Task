//
//  MovingTo.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit


struct MovingTo {
    
    static func productDetails(on vc: UIViewController, recipe: Recipe){
        let page = RecipeDetailsViewController(nibName: NibNamed.recipeDetails, bundle: nil)
        page.recipe = recipe
        vc.navigationController?.pushViewController(page, animated: true)
    }
}


