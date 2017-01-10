//
//  PeopleVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import Contacts

class PeopleVC: UIViewController, PeopleModalTransitionListener {

    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    @IBOutlet weak var containerViewContacts: UIView!
    @IBOutlet weak var containerViewNearbyUsers: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PeopleModalTransitionMediator.instance.setListener(listener: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenuFromPeople", sender: self)
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            view.endEditing(true)
            
            self.containerViewContacts.alpha = 1
            self.containerViewNearbyUsers.alpha = 0
            
        } else {
            
            view.endEditing(true)
            
            self.containerViewContacts.alpha = 0
            self.containerViewNearbyUsers.alpha = 1
        }
    }
    
    func popoverDismissed(selectedSlideInMenuOption: String) {
        
        if (selectedSlideInMenuOption == "Profile") {
            performSegue(withIdentifier: "peopleToProfile", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Settings") {
            performSegue(withIdentifier: "peopleToSettings", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Sign Out") {
            
            // PERFORM SIGN OUT LOGIC
            
            //performSegue(withIdentifier: "peopleToSignOut", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "About") {
            performSegue(withIdentifier: "peopleToAbout", sender: self)
            //------
            
        } else if (selectedSlideInMenuOption == "Contact") {
            performSegue(withIdentifier: "peopleToContact", sender: self)
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

