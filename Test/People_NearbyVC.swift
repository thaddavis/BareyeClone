//
//  People_NearbyVC.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class People_NearbyVC: UIViewController {
    
    @IBOutlet weak var searchBarForNearbyUsers: UISearchBar!
    
    @IBOutlet weak var nearbyUsersCollectionView: UICollectionView!
    
    @IBOutlet weak var geoQueryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedConfigureGeoQuery(_ sender: Any) {
        
        performSegue(withIdentifier: "toConfigureGeoQuery", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toConfigureGeoQuery" {
            (segue.destination as! People_ConfigureGeoQueryVC).delegate = self
        }
        
    }
    
}

extension People_NearbyVC: People_ConfigureGeoQueryVCDelegate {
    func updateDataForGeoQuery(data: String) {
        // FIRE GEOQUERY
        
        if (data != "---") {
            geoQueryLabel.text = data
        } else {
            geoQueryLabel.text = ""
        }
        
    }
}
