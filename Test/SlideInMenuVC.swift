//
//  SlideInMenuVC.swift
//  Test
//
//  Created by Thad Duval on 1/3/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class SlideInMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var menuOptions: [Dictionary<String, String>] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fillerView: UIView!
    
    var presentingVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentingVC = self.presentingViewController!
    
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.separatorStyle = .none
        self.tableView.layer.borderWidth = 2
        self.tableView.layer.borderColor = UIColor.black.cgColor
        
        
        // Slide In Menu Options
        var newEntry =  Dictionary<String, String>()
        
        newEntry["label"] = "Profile"
        newEntry["icon"] = "Profile"
        menuOptions.append(newEntry)
        
        newEntry["label"] = "Settings"
        newEntry["icon"] = "Settings"
        menuOptions.append(newEntry)
        
        newEntry["label"] = "Sign Out"
        newEntry["icon"] = "Exit"
        menuOptions.append(newEntry)
        
        newEntry["label"] = "About"
        newEntry["icon"] = "More"
        menuOptions.append(newEntry)
        
        newEntry["label"] = "Contact"
        newEntry["icon"] = "ContactCard"
        menuOptions.append(newEntry)
        // Slide In Menu Options
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideInMenuItemCell") as! SlideInMenuItemCell
        
        let option = menuOptions[indexPath.row]
        
        cell.updateUI(menuItem: option)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true, completion: {
            //            let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            //            
            //            let viewController: AboutVC = storyboard.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
            //            
            //            let nav: UINavigationController = storyboard.instantiateViewController(withIdentifier: "peopleNavigationController") as! UINavigationController
            //            
            //            nav.performSegue(withIdentifier: "peopleToAbout", sender: viewController)

            ModalTransitionMediator.instance.sendPopoverDismissed(modelChanged: true)
            
            //nav.pushViewController(viewController, animated: true)
        })
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
}
