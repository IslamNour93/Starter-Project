//
//  Constants.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation
import Keys

class Constants{
    
    //MARK: - Properties
    
    static let baseUrl = "https://api.unsplash.com/photos?"
    
    //MARK: - Helpers
    
    static func accessKey()->String{
        let key = EidolonKeys()
        return key.accessKey
    }
    
}
