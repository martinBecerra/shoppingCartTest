//
//  UIImageView+Convenience.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImageFromURL(_ url:String) {
        
        if let URL = URL(string: url) {
            
            self.kf.setImage(with: URL, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
}
