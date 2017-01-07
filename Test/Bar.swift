//
//  Bar.swift
//  Test
//
//  Created by Thad Duval on 1/7/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import Foundation

class Bar {
    
    private var _name: String!
    private var _imageUrl: String!
    private var _address: String!
    private var _geoLocation: String!
    
    var name:String {
        return _name
    }
    
    var imageUrl:String {
        return _imageUrl
    }
    
    var address:String {
        return _address
    }
    
    var geoLocation:String {
        return _geoLocation
    }
    
    init(name: String, imageUrl: String, address: String) {
        self._name = name
        self._imageUrl = imageUrl
        self._address = address
    }
    
    init(name: String, barData: Dictionary< String, AnyObject >) {
        self._name = name
        
        if let imageUrl = barData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let geoLocation = barData["geoLocation"] as? String {
            self._geoLocation = geoLocation
        }
        
    }
    
}
