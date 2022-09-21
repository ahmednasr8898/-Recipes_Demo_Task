//
//  SplashViewController.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 21/09/2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var splashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        animationSplash()
    }
    
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [AppColors.darkBlue.cgColor, AppColors.skyBlue.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func animationSplash(){
        splashLabel.text = ""
        let title = "Recipes App"
        var charIndex = 0.0
        
        for letter in title{
            
            Timer.scheduledTimer(withTimeInterval: 0.3 * charIndex, repeats: false) { timer in
                self.splashLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let vc = RecipesViewController(nibName: NibNamed.recipes, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
