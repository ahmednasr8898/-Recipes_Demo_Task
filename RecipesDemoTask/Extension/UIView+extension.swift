//
//  UIView+extension.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 19/09/2022.
//

import UIKit

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

extension UIView {
    func createFooterSpinner() -> UIView{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}

extension UIView {
    func createFooterNoMoreData() -> UIView{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 80))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        label.text = "لا يوجد نتائج اخري"
        label.textColor = AppColors.tomato
        label.font = UIFont(name: "Almarai-Bold", size: 14)
        label.textAlignment = .center
        footerView.addSubview(label)
        return footerView
    }
}
