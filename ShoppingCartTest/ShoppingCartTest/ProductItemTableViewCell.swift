//
//  ProductItemTableViewCell.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit
import DequeuableRegistrable

struct ProductItemEntity {
    
    var name:String = ""
    var NumberOfItems:Int = 0
    var price:Double = 0.0
    var imageURL:String
}

protocol ProductItemTableViewCellDelegate : class {
    
    func actionButton(cell:ProductItemTableViewCell)
    
}
class ProductItemTableViewCell: UITableViewCell,Dequeuable,Registrable {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    
    weak var delegate:ProductItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureDelegate(delegate:ProductItemTableViewCellDelegate) {
        
        self.delegate = delegate
        
    }
    func configureToBuy(product:ProductItemEntity) {
        
        self.productImage.setImageFromURL(product.imageURL)
        self.cellTextsSetup(name: product.name, subtitleText: "Stock: \(product.NumberOfItems)", ButtonText: " BUY \(product.price) ")
        
    }
    
    private func cellTextsSetup(name:String,subtitleText:String,ButtonText:String) {
        
        self.subtitleLabel.text = subtitleText
        self.productNameLabel.text = name
        self.actionButton.setTitle(ButtonText, for: .normal)
    }
    
    func configureToRemove(product:ProductItemEntity) {
        
        
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        
        self.delegate?.actionButton(cell: self)
        
    }
}
