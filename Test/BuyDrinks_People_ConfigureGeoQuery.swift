//
//  BuyDrinks_People_ConfigureGeoQuery.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

protocol BuyDrinks_People_ConfigureGeoQueryVCDelegate {
    func updateDataForGeoQuery(data: String)
}

class BuyDrinks_People_ConfigureGeoQueryVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var selectedRadius: String = ""
    
    var delegate: BuyDrinks_People_ConfigureGeoQueryVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["---", "1 mile", "5 miles", "10 miles", "20 miles"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedRadius = pickerData[pickerView.selectedRow(inComponent: 0)]
    }
    
    @IBAction func backToBuyDrinks_PeopleVC(_ sender: Any) {
    
        self.delegate?.updateDataForGeoQuery(data: self.selectedRadius)
        
        dismiss(animated: true, completion: nil)
    
    }
    
}
