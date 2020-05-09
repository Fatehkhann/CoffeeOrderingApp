//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 08/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        WebService().getAllOrders { (orders) in
            if let allOrders = orders {
                DispatchQueue.main.async {
                    self.orders = allOrders.map(OrderViewModel.init)
                }
                
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order 
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
}
