//
//  Product.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

class Product {
    
    var id:Int
    var name:String
    var stock:Int
    var price:Double
    var imageUrl:String
    
    init (id:Int,name:String,stock:Int,price:Double,imageUrl:String) {
        
        self.id = id
        self.name = name
        self.stock = stock
        self.price = price
        self.imageUrl = imageUrl
    }
    
}
