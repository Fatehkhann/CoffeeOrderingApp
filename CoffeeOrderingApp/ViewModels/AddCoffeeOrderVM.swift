//
//  AddCoffeeOrderVM.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 08/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation

class AddCoffeeOrderVM: ObservableObject {
    private var webService: WebService
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    init() {
        self.webService = WebService()
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
    func placeOrder() {
        let order = Order(name: self.name, coffeeName: self.coffeeName, size: self.size, total: self.total)
        
        self.webService.createCoffeeOrder(order: order) { (createOrderResponse) in
            //
        }
    }
}
