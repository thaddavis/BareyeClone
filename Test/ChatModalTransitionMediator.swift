//
//  ChatModalTransitionMediator.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

protocol ChatModalTransitionListener {
    func popoverDismissed(selectedSlideInMenuOption: String)
}

class ChatModalTransitionMediator {
    /* Singleton */
    class var instance: ChatModalTransitionMediator {
        struct Static {
            static let instance: ChatModalTransitionMediator = ChatModalTransitionMediator()
        }
        return Static.instance
    }
    
    private var listener: ChatModalTransitionListener?
    
    private init() {
        
    }
    
    func setListener(listener: ChatModalTransitionListener) {
        self.listener = listener
    }
    
    func sendPopoverDismissed(modelChanged: Bool, selectedSlideInMenuOption: String) {
        listener?.popoverDismissed(selectedSlideInMenuOption: selectedSlideInMenuOption)
    }
}

