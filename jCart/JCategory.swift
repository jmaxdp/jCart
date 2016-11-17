//
//  JCategory.swift
//  jCart
//
//  Created by CRS on 11/17/16.
//  Copyright © 2016 Jerry Maxey. All rights reserved.
//

import Foundation



class Category {
    
    var id = Int()
    var name = String()
    var imageData = String() {
        didSet {
            /*dispatch_async(dispatch_get_main_queue()) {
                guard let url = NSURL(string: "\(Website)\(self.imageData)") else {
                    return
                }
                
                guard let data = NSData(contentsOfURL: url) else {
                    return
                }
                guard let imageFromUrl = UIImage(data: data) else {
                    return
                }
                self.image = imageFromUrl
            }*/
        }
    }
    var image = UIImage()
    var descr = String()
    
    init(){
        
    }
    
    
}