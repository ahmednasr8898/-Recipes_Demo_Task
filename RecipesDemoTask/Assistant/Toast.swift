//
//  Toast.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

struct Toast {
    
    static func show(on vc: UIViewController, message : String) {
        let toastLabel = UILabel(frame: CGRect(x: vc.view.frame.size.width/2 - 75, y: vc.view.frame.size.height-100, width: 220, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "Almarai-Bold", size: 14)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        vc.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.3, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
