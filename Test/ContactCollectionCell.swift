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
        nameLbl.text = "label label label label label label label label"
        //nameLbl.text = self.CE.name
        //thumbImg.image = UIImage(named: "\(self.CE.pokedexId)")
    }
    
}
