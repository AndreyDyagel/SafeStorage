//
//  ImageTableViewCell.swift
//  SafeStorage
//
//  Created by Андрей on 22.01.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCellOutlet: UIImageView!
    @IBOutlet weak var imageNameCellOutlet: UILabel!
    
    static let identifare = "imageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
