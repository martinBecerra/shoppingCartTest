//
//  ShoppingCart.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

final class ShoppingCart {
    
     var shoppingCartList = [ShoppingItem]()
    
    func addProduct(product:Product) {
        
       let item = self.shoppingCartList.first { (shoppingItem) -> Bool in
           return shoppingItem.product.id == product.id
        }
        
        if item != nil {
            item!.numberOfItemSelected += 1
        }
        else {
            
            self.shoppingCartList.append(ShoppingItem(product: product))
        }
    }
    
    func removeProduct(product:Product) {
        
        let index = self.shoppingCartList.index { (item:ShoppingItem) -> Bool in
            return item.product.id == product.id
        }
        
        if index != nil {
            
            let item = self.shoppingCartList[index!]
            
            item.numberOfItemSelected -= 1
            
            if item.numberOfItemSelected == 0 {
             
                self.shoppingCartList.remove(at: index!)
            }
        }
        
    }
    
    func getTotalCost() -> Double {
        
        return self.shoppingCartList.reduce(0) { (partialResult, item) -> Double in
            return partialResult + item.product.price * Double(item.numberOfItemSelected)
        }
    }
    
    func numberOfItemsOfCart() ->Int {
        
        return self.shoppingCartList.reduce(0) { (partialResult, item) -> Int in
            return partialResult + item.numberOfItemSelected
        }
    }
}
