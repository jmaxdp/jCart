//
//  jCartCore.swift
//  jCart
//
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation

//import UIKit






public struct Address {
    var street = String()
    var suite = String()
    var city = String()
    var state = String()
    var zip = String()
    var country: String = "US"
}



public struct RequiredOption {
    var id = Int()
    var name = String()
    var price : Double = 0.00
    var isDefault = false
}


