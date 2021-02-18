//
//  ImageCollectionViewCell.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCellOutlet: UIImageView!
    @IBOutlet weak var checkMarkImageOutlet: UIImageView!
    
    static let identifare = "imageCell"
 
    func isSelected(_ isSelected: Bool) {
        if isSelected {
            checkMarkImageOutlet.image = UIImage(systemName: "checkmark.circle")
        } else {
            checkMarkImageOutlet.image = UIImage(systemName: "circle")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        checkMarkImageOutlet.isHidden = true
    }

}
