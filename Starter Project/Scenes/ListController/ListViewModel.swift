//
//  ListViewMode.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation

class ListViewModel:ListViewModelType{
    
    
    
    //MARK: - Properties
    
    private var bindReloadTableViewClosure:(()->Void)?
    private var errorService: (Error) -> Void = { _ in }
    private var baseModel = [BaseModel](){
        didSet{
            bindReloadTableViewClosure?()
        }
    }
}

extension ListViewModel{
    func bindToErrorService(error: @escaping (Error) -> Void) {
        self.errorService = error
    }
    
    func bindToRelaodTableView(action: @escaping () -> Void) {
        self.bindReloadTableViewClosure = action
    }
    
    func getPhotoItemCell(indexPath: IndexPath) -> String? {
        return baseModel[indexPath.row].urls?.full
    }
    
    func getSignleModel(indexPath: IndexPath)-> BaseModel{
        return baseModel[indexPath.row]
    }
        
    
    func getNumberOfPhotosCells() -> Int {
        return baseModel.count
    }
    
    func fetchAllPhotos() {
        Networking.shared.fetchAllPhotos { [weak self] result in
            switch result {
                
            case .success(let baseModel):
                
                self?.baseModel.append(contentsOf: baseModel)
            
                    
            case .failure(let failure):
                print(failure.localizedDescription)
                self?.errorService(failure)
            }
        }
    }
}
