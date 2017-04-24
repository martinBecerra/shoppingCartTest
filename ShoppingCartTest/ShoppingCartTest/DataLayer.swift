//
//  DataLayer.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

class DataLayer {
    
    func getProducts() -> [Product] {
        
        let imageUrls = ["https://images-na.ssl-images-amazon.com/images/I/717ytbvKqyL._SL1001_.jpg",
                          "https://images-na.ssl-images-amazon.com/images/I/71T63QicO8L._SL1500_.jpg",
                          "https://images-na.ssl-images-amazon.com/images/I/91TPmmUT5UL._SL1500_.jpg",
                          "https://images-na.ssl-images-amazon.com/images/I/715OSX-qukL._SL1500_.jpg"
                          ]
        let artNames = ["Magnetic Sculpture Desk Toy",
                        "Strongarm Blaster",
                        "Jenga",
                        "Rubik's Cube Game"]
        
        let prices = [10.0,
                      20.0,
                      12.0,
                      7.48]
        
        let stocks = [100,
                      5,
                      8,
                      5]
        
        
        var productList = [Product]()
        
        
        for (index, imageUrl) in imageUrls.enumerated() {
            productList.append(Product(id: index, name: artNames[index], stock: stocks[index], price: prices[index],imageUrl:imageUrl))
        }
        
        return productList
    }
}
