//
//  FolderTableViewCell.swift
//  SafeStorage
//
//  Created by Андрей on 22.01.2021.
//

import UIKit

class FolderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameFolderOutlet: UILabel!
    
    static let identifare = "folderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
