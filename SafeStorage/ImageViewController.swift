//
//  ImageViewController.swift
//  SafeStorage
//
//  Created by Андрей on 24.01.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var scrollViewOutlet: UIScrollView!
    @IBOutlet weak var stackViewOutlet: UIStackView!

    var imageArray: [URL] = []
    var indexImage: CGFloat = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollViewOutlet.contentOffset = CGPoint(x: view.bounds.width * indexImage, y: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allImageContent()
    }

}
