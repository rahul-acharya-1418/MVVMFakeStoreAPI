//
//  APIManager.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import Foundation

typealias handler<T> = (Result<T, Error>) -> Void

/// Use Final Class for stop Inheritance
final class APIManager {
    
    static let shared = APIManager()
    
    /// Singleton Design Pattern   (No one Create Object out of class private Key word)
    private init () {}
    
    func request <T: Decodable>(modelType: T.Type, type: EndPointType, completion: @escaping handler<T>){
        if let url = type.url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil  else { return }
                guard let response = response as? HTTPURLResponse,
                      200 ... 299 ~= response.statusCode else { return }
                
                do {
                    let jsonData = try JSONDecoder().decode(modelType, from: data)
                    completion(.success(jsonData))
                }
                catch (let jsonError) {
                    completion(.failure(jsonError))
                }
                
            }.resume()
        }
    }
    
    
}
