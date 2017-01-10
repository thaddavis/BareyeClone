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
    
    @IBOutlet weak var configureBarControl: UIControl!
    
    @IBOutlet weak var tipPercentageControl: UIControl!
    
    @IBOutlet weak var recipientLabel: UILabel!
    
    @IBOutlet weak var recipientImage: CircleImage!
    
    @IBOutlet weak var selectedBarLabel: UILabel!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    var selectedRecipientFromPeopleTab = ""
    var selectedBarFromBarsTab = ""
    var selectedRecipientFromPeopleImage:UIImage? = nil
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentageLabel.text = "15%"
        recipientLabel.text = "You"
        
        configureRecipientControl.addTarget(self, action: #selector(handleTouchConfigureRecipientControl), for: UIControlEvents.touchUpInside)
        
        tipPercentageControl.addTarget(self, action: #selector(handleTouchTipPercentageControl), for: UIControlEvents.touchUpInside)
        
        configureBarControl.addTarget(self, action: #selector(handleTouchConfigureBarControl), for: UIControlEvents.touchUpInside)
        
        BuyDrinksModalTransitionMediator.instance.setListener(listener: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (self.selectedRecipientFromPeopleTab != "") {
            self.recipientLabel.text = selectedRecipientFromPeopleTab
        }
        
        if (self.selectedBarFromBarsTab != "") {
            self.selectedBarLabel.text = selectedBarFromBarsTab
        }
        
        if (self.selectedRecipientFromPeopleImage != nil) {
            recipientImage.image = selectedRecipientFromPeopleImage
        } else {
            recipientImage.image = UIImage(named: "default-profile-picture")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func handleTouchTipPercentageControl(_ sender: UIControl) {
        
        performSegue(withIdentifier: "tipModal", sender: self)
    }
    
    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenuFromBuyDrinks", sender: self)
    }
    
    @IBAction func handleTouchConfigureRecipientControl(_ sender: UIControl) {
        
        performSegue(withIdentifier: "buyDrinksConfigureRecipient", sender: self)
        
    }
    
    @IBAction func handleTouchConfigureBarControl( _ sender: UIControl) {
        performSegue(withIdentifier: "buyDrinksConfigureBar", sender: self)
    }
    
    @IBAction func unwindToBuyDrinksHome(segue: UIStoryboardSegue) {
        
        if let sourceViewController = segue.source as? BuyDrinks_People_ContactsVC {
            let dataRecieved = sourceViewController.selectedRecipient
        
            if let imageReceived = sourceViewController.selectedRecipientImage {
                recipientImage.image = UIImage(data: imageReceived)
            } else {
                recipientImage.image = UIImage(named: "default-profile-picture")
            }
            
            recipientLabel.text = dataRecieved
            self.selectedRecipientFromPeopleTab = ""
        }
        else if let sourceViewController = segue.source as? BuyDrinks_BarsVC {
            let dataRecieved = sourceViewController.selectedBar
            
            selectedBarLabel.text = dataRecieved
            self.selectedBarFromBarsTab = ""
        }
        else if let sourceViewController = segue.source as? People_ContactsVC {
            
            self.selectedRecipientFromPeopleTab = sourceViewController.selectedRecipient
            
            if let imageReceived = sourceViewController.selectedRecipientImage {
                self.selectedRecipientFromPeopleImage = UIImage(data: imageReceived)
            } else {
                self.selectedRecipientFromPeopleImage = nil
            }
            
            self.tabBarController?.selectedIndex = 2
        
        }
        else if let sourceViewController = segue.source as? BarsVC {
            
            self.selectedBarFromBarsTab = sourceViewController.selectedBar
            
            self.tabBarController?.selectedIndex = 2
        }
    }
    
    @IBAction func unwindToBuyYourselfADrinkHome(segue: UIStoryboardSegue) {
        
        self.selectedRecipientFromPeopleTab = ""
        recipientLabel.text = "You"
        recipientImage.image = UIImage(named: "default-profile-picture")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? SlideInMenuVC {
            
            slideInTransitioningDelegate.direction = .left
            slideInTransitioningDelegate.disableCompactHeight = false
            controller.transitioningDelegate = slideInTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
        
        if segue.identifier == "tipModal" {
            (segue.destination as! BuyDrinks_TipModalVC).delegate = self
        }
        
    }
    
}

extension BuyDrinksVC: BuyDrinks_ConfigureTipVCDelegate {
    func updateTipAmount(data: String) {
        
        if (data != "---") {
            tipPercentageLabel.text = data
        } else {
            
            tipPercentageLabel.text = "5%"
        }
        
    }
}


