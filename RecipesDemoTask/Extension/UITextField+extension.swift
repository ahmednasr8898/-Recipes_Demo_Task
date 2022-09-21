//
//  UITextField+extension.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 21/09/2022.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        iconView.image = image
        iconView.tintColor = UIColor.darkGray
        iconView.contentMode = .scaleAspectFill
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
