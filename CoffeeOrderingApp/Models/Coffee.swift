//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 07/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
