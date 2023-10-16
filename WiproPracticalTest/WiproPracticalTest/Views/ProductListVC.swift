//
//  ProductListVC.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import UIKit

class ProductListVC: UIViewController {
    
    @IBOutlet var tableProduct: UITableView!
    
    var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuration()
    }
    
    func configuration() {
        
        tableProduct.register(UINib(nibName: ProductCell.identifier, bundle: nil),
                              forCellReuseIdentifier: ProductCell.identifier)
        tableProduct.rowHeight = 200
        
        observeEvent()
        initViewModel()
        
    }
    
    func initViewModel() {
        
        productViewModel.getProductListWithGenerics()
    }
    
    func observeEvent() {
        
        productViewModel.eventHandler = {[weak self] event in
            guard let self = self else {
                return
            }
            switch event {
            case .startLoading:
                
                print("loading.....")
            case .endLoading:
                
                print("Loading Complete.")
            case .dataLoaded:
                
                DispatchQueue.main.async {
                    self.tableProduct.reloadData()
                }
            case .dataAdded:
                
                self.showAlert("Success", strMessage: "Data Added")
            case .error(let error):
                
                self.showAlert("Error", strMessage: error.description)
            }
        }
    }
}

//MARK: - UITableViewDataSource Methods
extension ProductListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        tableCell.product = productViewModel.products[indexPath.row]
        return tableCell
    }
}

//MARK: - UITableviewDelegate Method
extension ProductListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let title = productViewModel.products[indexPath.row].category else {
            return
        }
        let product: [String: Any] = [
            "title": title
        ]
        productViewModel.callAddProduct(product: product)
    }
}
