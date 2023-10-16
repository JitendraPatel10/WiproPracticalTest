//
//  EndPointTypes.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation
import Alamofire


protocol EndPointTypes {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var body: Parameters? { get }
    var headers: HTTPHeaders { get }
}

enum EndPointsItem {
    
    case product
    case addProduct(product: Parameters)
}

extension EndPointsItem: EndPointTypes {
    
    var path: String {
        switch self {
        case .product:
            return "products"
        case .addProduct:
            return "products/add"
        }
    }
    
    var baseURL: String {
        switch self {
        case .product:
            return "https://fakestoreapi.com/"
        case .addProduct:
            return "https://dummyjson.com/"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethod {
        switch self {
        case .product:
            return .get
        case .addProduct:
            return .post
        }
    }
    
    var body: Parameters? {
        switch self {
        case .product:
            return nil
        case .addProduct(let product):
            return product
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        return ServiceManager.commonHeaders
    }
}

