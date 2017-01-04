//
//  SlideInMenuItemCell.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class SlideInMenuItemCell: UITableViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    func updateUI( menuItem:Dictionary<String,String> ) {
        icon.image = UIImage(named: menuItem["icon"]!)
        label.text = menuItem["label"]
    }
    
}
