//
//  ContactCollectionCell.swift
//  Test
//
//  Created by Thad Duval on 1/6/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import Contacts

class ContactCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var CE: CNContact!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ contact: CNContact) {
        self.CE = contact
        nameLbl.text = self.CE.givenName + " " + self.CE.middleName + " " + self.CE.familyName
        
        
        if ((self.CE.imageData) != nil) {
            thumbImg.image = UIImage(data: self.CE.imageData!)
        } else {
            thumbImg.image = UIImage(named: "default-profile-picture.jpg")
        }
        
    }
    
}
