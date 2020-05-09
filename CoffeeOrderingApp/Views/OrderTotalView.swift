//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 08/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f",self.total)).font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 23.90)
    }
}
