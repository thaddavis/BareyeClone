//
//  RoundedButton.swift
//  Test
//
//  Created by Thad Duval on 1/10/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
    
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        layer.cornerRadius = 4
        
        
    }
}
