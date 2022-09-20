//
//  UIView+extension.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit

extension UIView{
    func playWithView(backgroundColor: UIColor?, cornerRadius: CGFloat = 0.0, shadowColor: CGColor?, shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0), shadowRadius: CGFloat = 0.0, shadowOpacity: Float = 0.0){
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity 
    }
}

extension UIView{
    func animationWithView(){
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn) {
                
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { _ in
            }
        }
    }
}
