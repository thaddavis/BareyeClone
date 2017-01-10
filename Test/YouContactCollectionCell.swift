//
//  YouContactCollectionCell.swift
//  Test
//
//  Created by Thad Duval on 1/10/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import Contacts

class YouContactCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell( contactName: String, imageName: String? ) {
        nameLbl.text = ""
        
        if ((imageName) != nil) {
            thumbImg.image = UIImage(named: imageName!)
            thumbImg.alpha = CGFloat(1.0)
        }
        
    }
    
}

