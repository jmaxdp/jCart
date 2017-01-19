//
//  JCart.swift
//  jCart
//
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation


public class JCart: NSObject {
    
    
    var items = [JProduct]() {
        didSet {
            calculateSubtotal()
        }
    }
    
    
    var subtotal : Double = 0
    var grandtotal : Double = 0
    var tax : Double = 0
    var tip : Double = 0
    var discounts : Double = 0
    var otherFees : Double = 0
    
    
    
    public override init() {
        
    }
    
    public func calculateSubtotal() {
        var qty = 0
        var currentTotal = Double()
        for aProduct in items {
            currentTotal += (aProduct.price) * Double(aProduct.qty)
            qty += aProduct.qty
        }
        print("cart quantity is \(qty)")
        self.subtotal = currentTotal
        self.calculateGrandTotal()
        
    }
    
    public func calculateGrandTotal(){
        let priceWithTax = (subtotal) + (subtotal * tax)
        self.grandtotal = priceWithTax
        self.grandtotal -= self.discounts
        self.grandtotal += self.tip
        self.grandtotal += self.otherFees
    }
    
}

