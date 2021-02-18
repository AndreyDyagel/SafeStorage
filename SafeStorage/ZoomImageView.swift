//
//  ZoomImageView.swift
//  SafeStorage
//
//  Created by Андрей on 15.02.2021.
//

import UIKit

class ZoomImageView: UIView {
    
    @IBOutlet weak var scrollViewOutlet: UIScrollView!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollViewOutlet.delegate = self
    }

}

extension ZoomImageView: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewOutlet
    }

}
