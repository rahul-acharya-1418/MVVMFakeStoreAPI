//
//  FSProductViewModel.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import Foundation



final class FSProductViewModel {
    
    var productsArray: [FSProducts] = []
    var eventClosure: ((_ event: Event) -> Void)? // Data Binding
    
    func fetchProducts(){
        APIManager.shared.request(
            modelType: [FSProducts].self,
            type: EndPointItem.products) { response in
                switch response {
                case .success(let product):
                    self.productsArray = product
                    self.eventClosure?(.validate)
                case .failure(let error):
                    self.eventClosure?(.error(error))
                }
            }
    }
    
    
}


extension FSProductViewModel {
    enum Event {
        case validate
        case error(Error?)
    }
}
