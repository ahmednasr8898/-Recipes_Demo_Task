//
//  Constant.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 18/09/2022.
//

import UIKit

struct NibNamed {
    static let recipes = "Recipes"
    static let recipeDetails = "RecipeDetails"
    static let splash = "Splash"
}

struct AppColors {
    static let systemColor = UIColor(named: "systemColor") ?? UIColor()
    static let tomato = UIColor(named: "tomato") ?? UIColor()
    static let darkBlue = UIColor(named: "darkBlue") ?? UIColor()
    static let skyBlue = UIColor(named: "skyBlue") ?? UIColor()
}

struct AppImages {
    static let shareImage = UIImage(named: "share")
}

struct UserDefaultsNamed {
    static let historySearch = "historySearch"
}

struct NetworkingInfo {
    static let app_id = "364ffa3d"
    static let app_key = "cfc6a3577745554855dbc3eaa508f050"
}
