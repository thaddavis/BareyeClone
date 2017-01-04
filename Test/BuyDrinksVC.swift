//
//  BuyDrinksVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class BuyDrinksVC: UIViewController, BuyDrinksModalTransitionListener {
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BuyDrinksModalTransitionMediator.instance.setListener(listener: self)
    }
    
    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenuFromBuyDrinks", sender: self)
    }
    
    func popoverDismissed(selectedSlideInMenuOption: String) {
        
        if (selectedSlideInMenuOption == "Profile") {
            performSegue(withIdentifier: "buyDrinksToProfile", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Settings") {
            performSegue(withIdentifier: "buyDrinksToSettings", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Sign Out") {
            
            // PERFORM SIGN OUT LOGIC
            
            //performSegue(withIdentifier: "buyDrinksToSignOut", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "About") {
            performSegue(withIdentifier: "buyDrinksToAbout", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Contact") {
            performSegue(withIdentifier: "buyDrinksToContact", sender: self)
            //------
            
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? SlideInMenuVC {
            
            slideInTransitioningDelegate.direction = .left
            slideInTransitioningDelegate.disableCompactHeight = false
            controller.transitioningDelegate = slideInTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
        
    }
    
    
}


