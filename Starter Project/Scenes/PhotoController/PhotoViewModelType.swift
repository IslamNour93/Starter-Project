//
//  PhotoViewModelType.swift
//  Starter Project
//
//  Created by Islam NourEldin on 01/04/2023.
//

import Foundation


typealias PhotoViewModelType = PhotoViewModelInput & PhotoViewModelOutput

protocol PhotoViewModelInput{
    
}

protocol PhotoViewModelOutput{
    
    func getImageUrl()->String
}
