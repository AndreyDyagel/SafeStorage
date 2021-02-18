//
//  FolderCollectionViewCell.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameFolderCellOutlet: UILabel!
    @IBOutlet weak var checkMarkFolderOutlet: UIImageView!
    
    static let identifare = "folderCell"
    
    func isSelected(_ isSelected: Bool) {
        if isSelected {
            checkMarkFolderOutlet.image = UIImage(systemName: "checkmark.circle")
        } else {
            checkMarkFolderOutlet.image = UIImage(systemName: "circle")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        checkMarkFolderOutlet.isHidden = true
    }
    
}
