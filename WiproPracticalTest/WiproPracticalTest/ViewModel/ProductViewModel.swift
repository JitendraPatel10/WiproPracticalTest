//
//  ProductViewModel.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation

final class ProductViewModel {
    
    ///This variable hold list of products.
    var products = [Product]()
    
    ///Use this closures for handle event of ProductViewModel
    var eventHandler: ((_ event: EventHandler) ->Void)?
    
    func getProductListWithGenerics() {
        
        eventHandler?(.startLoading)
        ServiceManager.shared.makeRequest(
            endPointType: EndPointsItem.product
        ) { [weak self] (result:Result<[Product], CustomError>) in
            
            guard let self else {
                return
            }
            
            self.eventHandler?(.endLoading)
            switch result {
            case .success(let productData):
                
                self.products = productData
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func callAddProduct(product: [String: Any]) {
        
        eventHandler?(.startLoading)
        ServiceManager.shared.makeRequest(
            endPointType: EndPointsItem.addProduct(product: product)
        ) { [weak self] (result: Result<AddProductModel, CustomError>) in
            
            guard let self else {
                return
            }
            self.eventHandler?(.endLoading)
            switch result {
            case .success(let productData):
                
                print("Product Data is: \(productData)")
                self.eventHandler?(.dataAdded)
            case .failure(let error):
                
                print("Error: \(error.description)")
            }
        }
    }
}
