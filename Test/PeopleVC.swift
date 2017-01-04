//
//  PeopleVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class PeopleVC: UIViewController, ModalTransitionListener {

    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        
        
        ModalTransitionMediator.instance.setListener(listener: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toSlideInMenu(_ sender: Any) {
        performSegue(withIdentifier: "toSlideInMenu", sender: nil)
    }
    
    @IBAction func go(_ sender: Any) {
        performSegue(withIdentifier: "peopleToAbout", sender: self)
    }
    
    func popoverDismissed() {
        self.navigationController?.dismiss(animated: true, completion: nil)
        
        print("popOverDismissed")
        
        performSegue(withIdentifier: "peopleToAbout", sender: self)
    }
    
    func fromPeopleToAbout() {

//        let aboutVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
//        
//        let nav = UINavigationController(rootViewController: self)
//        
//        print(nav)
//        
//        nav.pushViewController(aboutVC, animated: true)
        
        performSegue(withIdentifier: "peopleToAbout", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? SlideInMenuVC {
            
            slideInTransitioningDelegate.direction = .left
            slideInTransitioningDelegate.disableCompactHeight = false
            controller.transitioningDelegate = slideInTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
    
    }
    
}

