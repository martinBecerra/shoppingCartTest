//
//  ShoppingCartPresenterImp.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

class ProductListPresenterImp: ProductListPresenter {
    
    let dataLayer = DataLayer ()
    let products:[Product]
    
    init() {
        self.products = self.dataLayer.getProducts()
    }
    
    func numberOfProducts() -> Int {
        return self.products.count
    }
    
    func getProductEntity(pos:Int) -> ProductItemEntity {
        
        let product = self.products[pos]
        let viewEntity = ProductItemEntity(name: product.name , NumberOfItems: product.stock, price: product.price)
        
        return viewEntity
        
    }
    
    
}
