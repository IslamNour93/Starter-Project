//
//  ApiProtocol.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation
import Alamofire

protocol API {
    var path: String { get }
    
    var headers: HTTPHeaders { get }
    
    var method: HTTPMethod { get }
}
