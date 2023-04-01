//
//  ListViewModelType.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import Foundation


typealias ListViewModelType = ListViewModelInput & ListViewModelOutput

protocol ListViewModelInput{
    
}

protocol ListViewModelOutput{
    
    func bindToErrorService(error: @escaping (Error) -> Void)
    func bindToRelaodTableView(action: @escaping () -> Void)
    func getPhotoItemCell(indexPath: IndexPath)-> String?
    func getNumberOfPhotosCells() -> Int
    func fetchAllPhotos()
}
