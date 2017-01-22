//
//  JCustomer.swift
//  jCart
//
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation



public class JCustomer {
    var email : String
    var firstName : String
    var id : Int
    var lastName : String?
    var username : String
    var rewards : Double
    var previousAddress = [Address]()
    var previousOrders = [JOrder]()
    
    init(id:Int,username:String,email:String,firstName:String,lastName:String?,rewards:Double) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.rewards = rewards
    }
}
