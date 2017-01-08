//
//  BuyDrinks_TipModalVC.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit

protocol BuyDrinks_ConfigureTipVCDelegate: class {
    func updateTipAmount(data: String)
}

class BuyDrinks_TipModalVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var tipPercentagesList = [String]()
    var selectedPercentage = "5%"
    
    weak var delegate: BuyDrinks_ConfigureTipVCDelegate?
    
    @IBOutlet weak var tipPicker: UIPickerView!
    
    override func viewDidLoad() {
        
        //view.backgroundColor = UIColor.clear
        //view.isOpaque = false
        self.tipPercentagesList.append("---")
        self.tipPercentagesList.append("5%")
        self.tipPercentagesList.append("10%")
        self.tipPercentagesList.append("15%")
        self.tipPercentagesList.append("20%")
        self.tipPercentagesList.append("25%")
        self.tipPercentagesList.append("30%")
        
        tipPicker.delegate = self
        tipPicker.dataSource = self
        
        tipPicker.reloadAllComponents()
        
    }
    
    @IBAction func backToBuyDrinks(_ sender: Any) {
        
        self.delegate?.updateTipAmount(data: self.selectedPercentage)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIPickerView DELEGATE CODE ----------***********
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns number of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.tipPercentagesList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let selectedPercent: String = self.tipPercentagesList[row] as String
        return selectedPercent
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let chosen: String = tipPercentagesList[row] as String
        self.selectedPercentage = chosen
        
    }
    
}
