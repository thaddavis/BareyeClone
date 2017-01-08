//
//  BuyDrinks_BarsVC.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

class BuyDrinks_BarsVC: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var allBars = [Bar]()
    var allBarsFiltered = [Bar]()
    var inSearchMode = false
    
    // Need proper model
    var selectedBar = ""
    
    @IBOutlet weak var searchBarForBars: UISearchBar!
    
    @IBOutlet weak var barsTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        barsTableView.delegate = self
        barsTableView.dataSource = self
        
        searchBarForBars.delegate = self
        
        searchBarForBars.returnKeyType = UIReturnKeyType.done
        searchBarForBars.enablesReturnKeyAutomatically = false
        
        // Fetch Contacts asynchronously
        DispatchQueue.global(qos: .background).async {
            self.findBars()
            
            DispatchQueue.main.async() {
                
                self.barsTableView.reloadData()
                
            }
        }
        
    }
    
    func findBars() {
        
        let bar1 = Bar(name: "Able & Baker", imageUrl: "barImage1", address: "Miami")
        
        let bar2 = Bar(name: "Bareye Tavern", imageUrl: "barImage2", address: "Miami")
        
        let bar3 = Bar(name: "Churchill's Pub", imageUrl: "barImage3", address: "Miami")
        
        self.allBars.append(bar1)
        self.allBars.append(bar2)
        self.allBars.append(bar3)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !inSearchMode {
            return allBars.count
        } else {
            return allBarsFiltered.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        if !inSearchMode {
            self.selectedBar = self.allBars[indexPath.row].name
        } else {
            self.selectedBar = self.allBarsFiltered[indexPath.row].name
        }
        
        self.performSegue(withIdentifier: "unwindToBuyDrinksHome", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var aBar: Bar
        
        if !inSearchMode {
            aBar = self.allBars[indexPath.row]
        } else {
            aBar = self.allBarsFiltered[indexPath.row]
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BarTableViewCell") as? BarTableViewCell {
            
            cell.configureCell(bar: aBar)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedConfigureBarsGeoQuery(_ sender: Any) {
        
        performSegue(withIdentifier: "toConfigureBarsGeoQuery", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //----------********** SEARCH BAR DELEGATE CODE
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text == nil || searchBar.text == "") {
            inSearchMode = false
            barsTableView.reloadData()
            view.endEditing(true)
            
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            allBarsFiltered = allBars.filter(
                {
                    $0.name.lowercased().range(of: lower) != nil
                }
            )
            
            barsTableView.reloadData()
        }
    }
}

extension BuyDrinks_BarsVC: BuyDrinks_Bars_ConfigureBarsGeoQueryVCDelegate {
    func updateDataForGeoQuery(data: String) {
        
        // FIRE GEOQUERY
        
    }
}
