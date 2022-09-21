//
//  PaddingTextField.swift
//  moqwalat
//
//  Created by Semicolon on 17/05/2022.
//

import UIKit

class PaddingTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
