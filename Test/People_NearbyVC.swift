//
//  People_NearbyVC.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class People_NearbyVC: UIViewController {
    
    @IBOutlet weak var searchRadiusPicker: UIPickerView!
    
    @IBOutlet weak var searchBarForNearbyUsers: UISearchBar!
    
    @IBOutlet weak var nearbyUsersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
