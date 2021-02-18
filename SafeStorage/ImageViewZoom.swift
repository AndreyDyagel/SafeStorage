//
//  ImageViewZoom.swift
//  SafeStorage
//
//  Created by Андрей on 15.02.2021.
//

import UIKit

extension ImageViewController {
    
    func allImageContent() {
        for image in imageArray {
            if let imageView = Bundle.main.loadNibNamed("ZoomImageView", owner: nil, options: nil)?.first as? ZoomImageView {
                
                imageView.imageViewOutlet.image = UIImage(contentsOfFile: image.path)
                
                stackViewOutlet.addArrangedSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalTo: scrollViewOutlet.heightAnchor),
                    imageView.widthAnchor.constraint(equalTo: scrollViewOutlet.widthAnchor)
                ])
            }
        }
    }
}
