//
//  jCartCore.swift
//  jCart
//
//  Created by Jerry Maxey on 11/11/16.
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation
//: Playground - noun: a place where people can play

//import UIKit


public class JProduct: NSObject, NSCopying {
    
    var id: String
    var name : String
    var desc = String()
    var qty : Int
    var price : Double {
        didSet {
            
        }
    }
    
    var modPrice : Double?
    var image : UIImage?
    var category = String()
    var attributes = [String:AnyObject]()
    
    
    public init(id:String, name:String, price:Double) {
        self.id = id
        self.name = name
        self.price = price
        self.qty = 1
    }
    
    public convenience init(id:String){
        self.init(id:id, name:"product_\(id)", price: 0)
        self.id = id
    }
    
    
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = JProduct(id:self.id)
        copy.name = self.name
        copy.price = self.price
        copy.desc = self.desc
        copy.image = self.image
        copy.attributes = self.attributes
        copy.category = self.category
        return copy
    }
    
    public func equals(compareTo:JProduct) -> Bool {
        var isEquals = true
        if self.name == compareTo.name &&
            self.desc == compareTo.desc &&
            self.price == compareTo.price &&
            self.category == compareTo.category &&
            self.image == compareTo.image {
            for (key,value) in attributes {
                for (k,v) in compareTo.attributes {
                    if key == k {
                        if let valueString = value as? NSString, let vString = v as? NSString {
                            if valueString != vString {
                                isEquals = false
                            }
                        }
                        else if let valueInt = value as? NSNumber, let vInt = v as? NSNumber {
                            if valueInt != vInt {
                                isEquals = false
                            }
                        }
                        else if let valueBool = value as? Bool, let vBool = v as? Bool {
                            if valueBool != vBool {
                                isEquals = false
                            }
                        }
                    }
                }
            }
            print("Product is equal = \(isEquals) inside compare name price and image")
        } else {
            isEquals = false
        }
        print("item is a duplicate = \(isEquals)")
        return isEquals
    }
    
    
}


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

public class Combo: NSObject {
    
    var mainCourse : JProduct
    var sides = [JProduct]()
    var sideLimit = Int()
    
    public init(mainCourse : JProduct) {
        self.mainCourse = mainCourse
    }
    
}

public class Section:NSObject {
    var name = String()
    var products = [JProduct]()
    public override init() {
        
    }
}



public class Menu: NSObject {
    
    var sections = [Section]()
    
    public override init() {
        
    }
    
    
}









