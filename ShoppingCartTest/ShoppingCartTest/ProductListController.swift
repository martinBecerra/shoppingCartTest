//
//  ProductListController.swift
//  ShoppingCartTest
//
//  Created by Admin on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

protocol ProductListPresenter: class{
    
    func numberOfProducts() -> Int
    func getProductEntity(pos:Int) -> ProductItemEntity
    func addToCartItem(pos:Int)
   
}

class ProductListController: BaseViewController {

    @IBOutlet weak var productListTableView: UITableView!
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var numberOfItemContainer: UIView!
    @IBOutlet weak var numberOfItemLabel: UILabel!
    
    var presenter:ProductListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Products"

        self.presenterSetup()
        self.productListSetup()
        
        // Do any additional setup after loading the view.
    }
    
    private func presenterSetup() {
        self.presenter = ProductListPresenterImp(delegate:self)
       
    }
    private func productListSetup(){
        self.productListTableView.delegate = self
        self.productListTableView.dataSource = self
        self.productListTableView.tableFooterView = UIView()
        
       ProductItemTableViewCell.register(in: productListTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ProductListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.presenter.numberOfProducts()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ProductItemTableViewCell.dequeue(from: tableView)
        
        cell.configureToBuy(product: self.presenter.getProductEntity(pos: indexPath.row))
        
        cell.configureDelegate(delegate: self)
        return cell
    }
}

extension ProductListController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ProductListController : ProductItemTableViewCellDelegate {
    
    func actionButton(cell:ProductItemTableViewCell) {
        
        if let index = self.productListTableView.indexPath(for: cell) {
                self.presenter.addToCartItem(pos: index.row)
        }
        
    }
}

extension ProductListController : ProductListPresenterDelegate {
    
    func updateTotalCost(totalCost:Double) {
        self.costLabel.text = "Cost U$S \(totalCost)"
    }
    
    func updateNumberOfItemsOfCart(numberOfItems:Int) {
        
        if numberOfItems == 0 {
            self.numberOfItemContainer.isHidden = true
        }
        else {
            self.numberOfItemContainer.isHidden = false
            self.numberOfItemLabel.text = "\(numberOfItems)"
        }
        
        self.productListTableView.reloadData()
    }
}
