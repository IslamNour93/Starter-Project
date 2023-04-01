//
//  Networking.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation
import Alamofire

class Networking{
    
    //MARK: - Properties
    
    static let shared = Networking()
    
    private init(){}
    
    
    /// fetch all photos
    
    func fetchAllPhotos(completion: @escaping ((Result<[BaseModel],Error>) -> Void)){
        
        guard let url = URL(string: Constants.baseUrl + PhotosApi.fetchAllPhotos.path) else { return }
        
        let method = PhotosApi.fetchAllPhotos.method
        let headers = PhotosApi.fetchAllPhotos.headers
        
        AF.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: headers).response { response
            
            in
            
            switch response.result {
                
            case .success(_):
                guard let data = response.data else {return}
                do{
                    let jsonData = try JSONDecoder().decode([BaseModel].self, from: data)
                    completion(.success(jsonData))
                }catch{
                    completion(.failure(error))
                     print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}
