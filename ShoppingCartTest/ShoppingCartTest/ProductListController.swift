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
}

class ProductListController: UIViewController {

    @IBOutlet weak var productListTableView: UITableView!
    
    var presenter:ProductListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenterSetup()
        self.productListSetup()
        
        // Do any additional setup after loading the view.
    }
    
    private func presenterSetup() {
       self.presenter = ProductListPresenterImp()
       
    }
    private func productListSetup(){
        self.productListTableView.delegate = self
        self.productListTableView.dataSource = self
        
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
        
        return cell
    }
}

extension ProductListController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
