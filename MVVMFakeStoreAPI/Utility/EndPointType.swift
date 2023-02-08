//
//  EndPointType.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import Foundation


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}


protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    
}

enum EndPointItem {
    case products
}


extension EndPointItem: EndPointType {
    
    var baseURL: String {
        return "https://fakestoreapi.com"
    }
    
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
  
    var url: URL? {
        return URL(string: "\(baseURL)/\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
    
    
}
