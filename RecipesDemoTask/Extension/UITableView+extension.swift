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

extension UITableView {
    func setNoResultMessage(title: String, textColor: UIColor = .white) {
        let lblMessage = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        lblMessage.text = title
        lblMessage.textColor = textColor
        lblMessage.numberOfLines = 0
        lblMessage.textAlignment = .center
        lblMessage.font = UIFont(name: "Almarai-Bold", size: 16)
        lblMessage.sizeToFit()

        self.backgroundView = lblMessage
        self.separatorStyle = .none
    }

    func clearBackground() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    func checkIfNoDataFounded(title: String = "no history search" ,countOfData: Int, textColor: UIColor = AppColors.skyBlue){
        if countOfData == 0 {
            self.setNoResultMessage(title: title, textColor: textColor)
        }else{
            self.clearBackground()
        }
    }
}
