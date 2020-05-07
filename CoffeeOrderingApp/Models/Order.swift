//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 07/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import Foundation


struct Order: Codable {
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
}
