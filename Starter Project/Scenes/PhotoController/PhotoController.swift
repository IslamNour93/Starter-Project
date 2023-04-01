//
//  PhotoController.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import UIKit
import SDWebImage

class PhotoController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Properties
    
    var viewModel: PhotoViewModelType
    
    //MARK: - LifeCycle
    
    init( viewModel: PhotoViewModelType){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configurePhotoImageView()
    }
    
    func configurePhotoImageView(){
        photoImageView.sd_setImage(with: URL(string: viewModel.getImageUrl()))
    }
}
