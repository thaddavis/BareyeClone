//
//  BuyDrinks_PeopleVC.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class BuyDrinks_PeopleVC: UIViewController {
   
    @IBOutlet weak var containerViewContactsBuyDrinks: UIView!
    @IBOutlet weak var containerViewNearbyUsersBuyDrinks: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.endEditing(true)
            
            self.containerViewContactsBuyDrinks.alpha = 1
            self.containerViewNearbyUsersBuyDrinks.alpha = 0
            
        } else {
            view.endEditing(true)
            
            self.containerViewContactsBuyDrinks.alpha = 0
            self.containerViewNearbyUsersBuyDrinks.alpha = 1
        }
    }
    
    
}
