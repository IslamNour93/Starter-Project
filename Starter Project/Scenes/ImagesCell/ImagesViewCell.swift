//
//  ImagesViewCell.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import UIKit
import SDWebImage

class ImagesViewCell: UICollectionViewCell {
    
    //MARK: - Outlets

    @IBOutlet weak var photosImageView: UIImageView!
    
    //MARK: - Properties
    
    static let identifier = String(describing: ImagesViewCell.self)
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Helper Functions
    
    static func uiNib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    func ConfigureImageView(url: String) {

         photosImageView.sd_setImage(with: URL(string: url))
        
    }

}
