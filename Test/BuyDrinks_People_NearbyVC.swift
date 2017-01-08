//
//  BuyDrinks_People_NearbyVC.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import Contacts

class BuyDrinks_People_NearbyVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarForNearbyUsers: UISearchBar!
    
    @IBOutlet weak var nearbyUsersCollectionView: UICollectionView!
    
    @IBOutlet weak var geoQueryLabel: UILabel!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var nearbyUsers = [Any]()
    var filteredNearbyUsers = [Any]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nearbyUsersCollectionView.dataSource = self
        nearbyUsersCollectionView.delegate = self
        
        searchBarForNearbyUsers.delegate = self
        
        searchBarForNearbyUsers.returnKeyType = UIReturnKeyType.done
        searchBarForNearbyUsers.enablesReturnKeyAutomatically = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pressedConfigureGeoQuery(_ sender: Any) {
    
        performSegue(withIdentifier: "toBuyDrinksConfigureGeoQuery", sender: self)
        
    }
    
    //----------********** SEARCH BAR DELEGATE CODE
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text == nil || searchBar.text == "") {
            inSearchMode = false
            nearbyUsersCollectionView.reloadData()
            view.endEditing(true)
            
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredNearbyUsers = nearbyUsers.filter(
                {
                    ($0 as AnyObject).givenName!?.lowercased().range(of: lower) != nil                }
            )
            
            nearbyUsersCollectionView.reloadData()
        }
    }
    
    //----------********** UICollectionViewDelegate CODE
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCollectionCell", for: indexPath) as? ContactCollectionCell {
            
            var CE: Any!
            
            if !inSearchMode {
                CE = self.nearbyUsers[indexPath.row]
            } else {
                CE = self.filteredNearbyUsers[indexPath.row]
            }
            
            cell.layer.borderWidth = 0.5
            cell.frame.size.width = screenWidth / 3 - 8
            cell.frame.size.height = 172
            
            
            cell.configureCell(CE as! CNContact)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if !inSearchMode {
            return self.nearbyUsers.count
        } else {
            return self.filteredNearbyUsers.count
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width/3 - 8, height: 180)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toBuyDrinksConfigureGeoQuery" {
            (segue.destination as! BuyDrinks_People_ConfigureGeoQueryVC).delegate = self
        }
        
    }
    
}

extension BuyDrinks_People_NearbyVC: BuyDrinks_People_ConfigureGeoQueryVCDelegate {
    func updateDataForGeoQuery(data: String) {
        // FIRE GEOQUERY
        
        if (data != "---") {
            geoQueryLabel.text = data
        } else {
            geoQueryLabel.text = ""
        }
        
    }
}

