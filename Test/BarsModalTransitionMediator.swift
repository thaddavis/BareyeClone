//
//  BarsModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol BarsModalTransitionListener {
    func popoverDismissed()
}

class BarsModalTransitionMediator {
    /* Singleton */
    class var instance: BarsModalTransitionMediator {
        struct Static {
            static let instance: BarsModalTransitionMediator = BarsModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: BarsModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: BarsModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool) {
        listener?.popoverDismissed()
    }
}
