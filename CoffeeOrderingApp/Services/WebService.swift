//
//  WebService.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 08/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation

class WebService {
    
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderReponse?) -> ()) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        
        URLSession.shared.dataTask(with: request) { (data, URLResponse, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderReponse.self, from: data)
            
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
        
        
        
    }
    
    func getAllOrders (completion: @escaping ([Order]?)->Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let decodedOrder = try? JSONDecoder().decode([Order].self, from: data)
            completion(decodedOrder)
        }
    .resume()
    }
}
