//
//  ListController.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import UIKit
import SDWebImage

class ListController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var photosListCollection: UICollectionView!
    
    //MARK: - Properties
    
    private var viewModel:ListViewModelType
    var baseModel = [BaseModel]()
    
    // MARK: - LifeCycle
    
    init(viewModel:ListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        fetchAllPhotos()
        bindPhotosData()
    }
    
    //MARK: - private functions
    
    private func setupCollectionView(){
        photosListCollection.delegate = self
        photosListCollection.dataSource = self
        photosListCollection.register(ImagesViewCell.uiNib(), forCellWithReuseIdentifier: ImagesViewCell.identifier)
    }
}

//MARK: - FetchAllPhotos
extension ListController{

    private func fetchAllPhotos(){
        viewModel.fetchAllPhotos()
    }
}

//MARK: - bindPhotosData

extension ListController{
    
    private func bindPhotosData(){
        viewModel.bindToRelaodTableView {[weak self] in
            DispatchQueue.main.async {
                
                guard let self = self else {return}
                
                self.photosListCollection.reloadData()
            }
        
        }
    }
}

extension ListController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.getNumberOfPhotosCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesViewCell.identifier, for: indexPath) as! ImagesViewCell
        
        guard let photoUrl = viewModel.getPhotoItemCell(indexPath: indexPath) else {fatalError()}
        cell.ConfigureImageView(url: photoUrl)
        return cell
    }
    
}

extension ListController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = viewModel.getPhotoItemCell(indexPath: indexPath)
        
        
    }
}

extension ListController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (collectionView.frame.size.width - 10) / 2, height: (collectionView.frame.size.width - 10) / 2)
    }
}
