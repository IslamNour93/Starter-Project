//
//  PhotoViewModel.swift
//  Starter Project
//
//  Created by Islam NourEldin on 01/04/2023.
//

import Foundation

class PhotoViewModel{
    
    let baseModel: BaseModel
    
    init(baseModel: BaseModel) {
        self.baseModel = baseModel
    }
    
}

extension PhotoViewModel:PhotoViewModelType{
    func getImageUrl() -> String {
        guard let imageurl = baseModel.urls?.full else {return ""}
        return imageurl
    }
}
