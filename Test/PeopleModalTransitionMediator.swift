//
//  ModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol PeopleModalTransitionListener {
    func popoverDismissed(selectedSlideInMenuOption: String)
}

class PeopleModalTransitionMediator {
    /* Singleton */
    class var instance: PeopleModalTransitionMediator {
        struct Static {
            static let instance: PeopleModalTransitionMediator = PeopleModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: PeopleModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: PeopleModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool, selectedSlideInMenuOption: String) {
        listener?.popoverDismissed(selectedSlideInMenuOption: selectedSlideInMenuOption)
    }
}
