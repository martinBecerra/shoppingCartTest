//
//  ShoppingItem.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

final class ShoppingItem {
    
    var product:Product
    var numberOfItemSelected:Int
    
    init (product:Product) {
        
        self.product = product
        self.numberOfItemSelected = 0
        
    }
}
