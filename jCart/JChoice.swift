//
//  JChoice.swift
//  jCart
//
//  Created by CRS on 11/17/16.
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation


class Choice {
    
    
    var id = Int()
    var name = String()
    var content = NSArray() {
        didSet {
            for c in content {
                if let id = Int(c as! String) {
                    for choiceOption in choiceOptionKey {
                        let key = choiceOption as! NSDictionary
                        if id == key.valueForKey("id") as! Int {
                            var req = RequiredOption()
                            req.id = key.valueForKey("id") as! Int
                            req.name = key.valueForKey("content") as! String
                            req.price = Double(key.valueForKey("price") as! Int)
                            if id == defaultChoiceId {
                                req.isDefault = true
                            }
                            requiredOptions.append(req)
                        }
                    }
                }
            }
        }
    }
    var requiredOptions = [RequiredOption]()
    var choiceOptionKey = NSArray()
    var hasDefault = false
    var defaultChoiceId = 0
    
    init(){
        
    }
    
    
}