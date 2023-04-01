//
//  Api.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation
import Alamofire

enum PhotosApi: API {
    
    case fetchAllPhotos
    

    var path: String {
        switch self {
        case .fetchAllPhotos:
            return "client_id=\(Constants.accessKey())"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .fetchAllPhotos:
            return ["Content-Type":"application/json",
                    "Accept":"application/json"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchAllPhotos:
            return .get
       
        }
    }
}
