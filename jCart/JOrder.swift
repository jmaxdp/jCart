//
//  JOrder.swift
//  jCart
//
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation

public class JOrder: NSObject {
    
    var name : String
    var address_street : String
    var address_suite : String
    var address_city : String
    var address_state : String
    var address_zip : String
    var phone : String
    var email : String
    var date : String
    var time : String
    
    var type : String
    var subtotal : Double
    var state_taxes : Double
    var delivery_fee : Double
    var tip : Double
    var coupon_discount : Double
    var total_charge : Double
    var paid_with : String
    var special_instructions : String?
    var items_ordered : [JProduct]
    
    let currentDate = NSDate()
    var dateFormatter = NSDateFormatter()
    var customer : JCustomer?
    var address : Address?
    
    
    public init(name:String, address_street:String, address_suite:String, address_city:String, address_state:String, address_zip:String, phone:String, email:String, type:String, subtotal:Double, state_taxes:Double?, delivery_fee:Double?, tip:Double?, coupon_discount:Double?, total_charge:Double, paid_with:String, special_intstructions:String?,items_ordered:[JProduct]) {
        
        self.name = name
        self.address_street = address_street
        self.address_suite = address_suite
        self.address_city = address_city
        self.address_state = address_state
        self.address_zip = address_zip
        self.phone = phone
        self.email = email
        self.type = type
        self.subtotal = subtotal
        self.state_taxes = state_taxes != nil ? state_taxes! : 0
        self.delivery_fee = delivery_fee != nil ? delivery_fee! : 0
        self.tip = tip != nil ? tip! : 0
        self.coupon_discount = coupon_discount != nil ? coupon_discount! : 0
        self.total_charge = total_charge
        self.paid_with = paid_with
        self.special_instructions = special_instructions != nil ? special_instructions! : nil
        self.items_ordered = items_ordered
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        self.date = convertedDate
        dateFormatter.timeStyle = .ShortStyle
        let convertedTime = dateFormatter.stringFromDate(currentDate)
        self.time = convertedTime
    }
    
    public override convenience init() {
        self.init(name:"", address_street:"", address_suite:"", address_city:"", address_state:"", address_zip:"", phone:"", email:"", type:"", subtotal:0.0, state_taxes:nil, delivery_fee:nil, tip:nil, coupon_discount:nil,total_charge: 0,paid_with:"",special_intstructions: nil,items_ordered: [JProduct]())
    }
    
    
    
    
}

