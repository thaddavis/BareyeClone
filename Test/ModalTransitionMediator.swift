//
//  ModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol ModalTransitionListener {
    func popoverDismissed()
}

class ModalTransitionMediator {
    /* Singleton */
    class var instance: ModalTransitionMediator {
        struct Static {
            static let instance: ModalTransitionMediator = ModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: ModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: ModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool) {
        listener?.popoverDismissed()
    }
}
