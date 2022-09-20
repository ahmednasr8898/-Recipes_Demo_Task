//
//  UITableView+extension.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

extension UITableView {
    func setSpinnerFooter(spinner: UIView){
        DispatchQueue.main.async {
            self.tableFooterView = spinner
        }
    }
   
    func removeFooter(){
        DispatchQueue.main.async {
            self.tableFooterView = nil
        }
    }
}

