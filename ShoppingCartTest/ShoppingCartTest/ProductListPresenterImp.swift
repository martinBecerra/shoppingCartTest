//
//  ShoppingCartPresenterImp.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

protocol ProductListPresenterDelegate : class {
    func updateTotalCost(totalCost:Double)
    func updateNumberOfItemsOfCart(numberOfItems:Int)
    
}

class ProductListPresenterImp: ProductListPresenter {
    
    let dataLayer = DataLayer ()
    let products:[Product]
    var productWithStock = [Product]()
    let cart:ShoppingCart
    
    weak var delegate:ProductListPresenterDelegate?
    
    init(delegate:ProductListPresenterDelegate) {
        
        self.products = self.dataLayer.getProducts()
        
        self.productWithStock.append(contentsOf: self.products.filter({ (product) -> Bool in
            product.stock > 0
        }))
        
        self.cart = ShoppingCart()
        self.delegate = delegate
    }
    
    func numberOfProducts() -> Int {
        return self.productWithStock.count
    }
    
    func getProductEntity(pos:Int) -> ProductItemEntity {
        
        let product = self.productWithStock[pos]
        let viewEntity = ProductItemEntity(name: product.name , NumberOfItems: product.stock, price: product.price,imageURL:product.imageUrl)
        
        return viewEntity
        
    }
    
    func addToCartItem(pos: Int) {
        
        let product = self.productWithStock[pos]
        
        product.stock -= 1
        
        if product.stock == 0 {
            self.productWithStock.remove(at: pos)
        }
        
        self.cart.addProduct(product: self.products[pos])
        
        self.delegate?.updateTotalCost(totalCost: self.cart.getTotalCost())
        
        self.delegate?.updateNumberOfItemsOfCart(numberOfItems: self.cart.numberOfItemsOfCart())
        
    }
    
    
}
