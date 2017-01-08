//
//  BorderedView.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class BorderedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
