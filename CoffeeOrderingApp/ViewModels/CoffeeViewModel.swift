//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 08/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
    
    
}
