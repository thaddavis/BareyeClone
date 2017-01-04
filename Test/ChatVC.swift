//
//  ChatVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, ChatModalTransitionListener {
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChatModalTransitionMediator.instance.setListener(listener: self)
    }
    
    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenuFromChat", sender: self)
    }
    
    func popoverDismissed(selectedSlideInMenuOption: String) {
        
        if (selectedSlideInMenuOption == "Profile") {
            performSegue(withIdentifier: "chatToProfile", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Settings") {
            performSegue(withIdentifier: "chatToSettings", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Sign Out") {
            
            // PERFORM SIGN OUT LOGIC
            
            //performSegue(withIdentifier: "chatToSignOut", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "About") {
            performSegue(withIdentifier: "chatToAbout", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Contact") {
            performSegue(withIdentifier: "chatToContact", sender: self)
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
