//
//  MyDrinksModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol MyDrinksModalTransitionListener {
    func popoverDismissed(selectedSlideInMenuOption: String)
}

class MyDrinksModalTransitionMediator {
    /* Singleton */
    class var instance: MyDrinksModalTransitionMediator {
        struct Static {
            static let instance: MyDrinksModalTransitionMediator = MyDrinksModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: MyDrinksModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: MyDrinksModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool, selectedSlideInMenuOption: String) {
        listener?.popoverDismissed(selectedSlideInMenuOption: selectedSlideInMenuOption)
    }
}
