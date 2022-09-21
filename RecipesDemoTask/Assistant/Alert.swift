//
//  Alert.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 20/09/2022.
//

import UIKit

struct Alert {
    private static func createBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okButton)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func failedToConnectWithServerAlert(on vc: UIViewController){
        createBasicAlert(on: vc, with: "", message: "خطأ بالاتصال بالسيرفير")
    }
    
    static func defaultAlert(on vc: UIViewController, message: String){
        createBasicAlert(on: vc, with: "", message: message)
    }
}
