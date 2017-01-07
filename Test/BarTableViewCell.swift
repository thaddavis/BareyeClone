//
//  BarTableViewCell.swift
//  Test
//
//  Created by Thad Duval on 1/7/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

//
//  PostCell.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/29/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var barImg: UIImageView!
    @IBOutlet weak var barNameLbl: UILabel!
    
    var bar: Bar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(bar: Bar) {
        
        let attributes = [
            NSFontAttributeName : UIFont(name: "AvenirNext-Bold", size: 48.0)!,
            //NSBackgroundColorAttributeName: UIColor.white,
            NSForegroundColorAttributeName : UIColor.white,
            
            NSStrokeColorAttributeName: UIColor.black
            ,
            NSStrokeWidthAttributeName : -4.0] as [String : Any]
        
        let title = NSAttributedString(string: bar.name, attributes: attributes) //1
        
        self.barImg.image = UIImage(named: bar.imageUrl)
        
        self.barNameLbl.attributedText = title
        
    }
    
}

