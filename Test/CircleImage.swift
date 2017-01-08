//
//  CircleImage.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 0.5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //self.image =  UIImage(named:"")
        self.clipsToBounds = true
        self.backgroundColor = UIColor.blue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    
}

