//
//  JCombo.swift
//  jCart
//
//  Created by CRS on 11/17/16.
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation


public class Combo: NSObject {
    
    var mainCourse : JProduct
    var sides = [JProduct]()
    var sideLimit = Int()
    
    public init(mainCourse : JProduct) {
        self.mainCourse = mainCourse
    }
    
}