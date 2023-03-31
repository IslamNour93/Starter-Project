//
//  ListController.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import UIKit

class ListController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var photosListCollection: UICollectionView!
    
    //MARK: - Properties
    
    private var viewModel:ListViewModelType
    
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

        setupDelegates()
    }
    
    //MARK: - private functions
    
    private func setupDelegates(){
        photosListCollection.delegate = self
        photosListCollection.dataSource = self
        photosListCollection.register(ImagesViewCell.uiNib(), forCellWithReuseIdentifier: ImagesViewCell.identifier)
    }

}

extension ListController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesViewCell.identifier, for: indexPath) as! ImagesViewCell
        
        return cell
    }
    
    
}
