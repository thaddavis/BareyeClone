//
//  BuyDrinksModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol BuyDrinksModalTransitionListener {
    func popoverDismissed(selectedSlideInMenuOption: String)
}

class BuyDrinksModalTransitionMediator {
    /* Singleton */
    class var instance: BuyDrinksModalTransitionMediator {
        struct Static {
            static let instance: BuyDrinksModalTransitionMediator = BuyDrinksModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: BuyDrinksModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: BuyDrinksModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool, selectedSlideInMenuOption: String) {
        listener?.popoverDismissed(selectedSlideInMenuOption: selectedSlideInMenuOption)
    }
}
