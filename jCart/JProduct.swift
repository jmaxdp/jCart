//
//  JProduct.swift
//  jCart
//
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation

public class JProduct: NSObject, NSCopying {
    
    var id: String
    var name : String
    var desc = String()
    var qty : Int
    var price : Double {
        didSet {
            
        }
    }
    var originalPrice : Double
    var modPrice : Double?
    var image : UIImage?
    var category = String()
    var attributes = [String:AnyObject]()
    
    
    var thumb : UIImage?
    var ingredients = [String?]()
    var ingredientsRemoved = String()
    var rating = Int?()
    var options = [Option]()
    var choices = [Choice]() {
        didSet {
            for c in choices {
                for opt in c.requiredOptions {
                    if opt.isDefault {
                        self.choicesAdded.append(opt)
                    }
                }
            }
        }
    }
    var addedOptions = [Option]() {
        didSet{
            adjustPriceFromOptions()
            adjustPriceFromChoices()
        }
    }
    var isSettingOriginalPrice = true
    var editedIngredients = [String]()
    var quantity = 1
    var itemNum = Int()
    var specialInstructions : String? {
        didSet{
            print("PRODUCT SPECIAL INSTRUCTIONS = \(specialInstructions!)")
        }
    }
    var choicesAdded = [RequiredOption]() {
        didSet {
            adjustPriceFromChoices()
        }
    }
    var priceWithOptions : Double = 0.00
    
    
    
    public init(id:String, name:String, price:Double) {
        self.id = id
        self.name = name
        self.originalPrice = price
        self.price = price
        self.qty = 1
    }
    
    public convenience init(id:String){
        self.init(id:id, name:"product_\(id)", price: 0)
        self.id = id
    }
    
    func adjustPriceFromChoices(){
        var choiceTotal : Double = 0.00
        for choice in choicesAdded {
            choiceTotal += choice.price
        }
        self.price = self.priceWithOptions != 0.00 ? choiceTotal + self.priceWithOptions : choiceTotal + self.originalPrice
    }
    
    func adjustPriceFromOptions(){
        var optionTotal : Double = 0.00
        for option in addedOptions {
            optionTotal += option.price
        }
        self.price = optionTotal + self.originalPrice
        self.priceWithOptions = optionTotal + self.originalPrice
        print("price has been adjiusted to \(self.price)")
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
