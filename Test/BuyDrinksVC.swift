//
//  BuyDrinksVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class BuyDrinksVC: UIViewController, BuyDrinksModalTransitionListener {
    
    
    @IBOutlet weak var configureRecipientControl: UIControl!
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRecipientControl.addTarget(self, action: #selector(handleTouchConfigureRecipientControl), for: UIControlEvents.touchUpInside)
        
        BuyDrinksModalTransitionMediator.instance.setListener(listener: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func handleTouchConfigureRecipientControl(_ sender: UIControl) {
        
        
        performSegue(withIdentifier: "buyDrinksConfigureRecipient", sender: self)
        
    }
    
    //print("configureBar")
        
    //performSegue(withIdentifier: "buyDrinksConfigureBar", sender: self)
    
    //print("configureDrink")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? SlideInMenuVC {
            
            slideInTransitioningDelegate.direction = .left
            slideInTransitioningDelegate.disableCompactHeight = false
            controller.transitioningDelegate = slideInTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
        
    }
    
    
}


