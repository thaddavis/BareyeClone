//
//  MyDrinksVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class MyDrinksVC: UIViewController, MyDrinksModalTransitionListener {
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        MyDrinksModalTransitionMediator.instance.setListener(listener: self)
    }
    
    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenuFromMyDrinks", sender: self)
    }
    
    func popoverDismissed(selectedSlideInMenuOption: String) {
        
        if (selectedSlideInMenuOption == "Profile") {
            performSegue(withIdentifier: "myDrinksToProfile", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Settings") {
            performSegue(withIdentifier: "myDrinksToSettings", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Sign Out") {
            
            // PERFORM SIGN OUT LOGIC
            
            //performSegue(withIdentifier: "myDrinksToSignOut", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "About") {
            performSegue(withIdentifier: "myDrinksToAbout", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Contact") {
            performSegue(withIdentifier: "myDrinksToContact", sender: self)
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
