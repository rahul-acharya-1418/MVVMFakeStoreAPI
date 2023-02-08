//
//  FSProducts.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import Foundation


struct FSProducts: Codable {
    
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating
    
}



