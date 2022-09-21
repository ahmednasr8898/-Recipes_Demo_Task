//
//  Helper.swift
//  RecipesDemoTask
//
//  Created by Semicolon on 21/09/2022.
//

import Foundation


class Helper {
    
    static let shared = Helper()
    
    private init() {
        
    }
    
    func saveLatestHistorySearch(historySearchWord: String) {
        var arr = getLatestHistorySearch()
        if arr.count >= 10 {
            arr.removeLast()
            arr.append(historySearchWord)
        }else{
            arr.append(historySearchWord)
        }
        let defaults = UserDefaults.standard
        defaults.set(arr, forKey: UserDefaultsNamed.historySearch)
    }
    
    func getLatestHistorySearch()-> [String] {
        let defaults = UserDefaults.standard
        return defaults.stringArray(forKey: UserDefaultsNamed.historySearch) ?? [String]()
    }
}
