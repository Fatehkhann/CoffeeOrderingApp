//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Fateh Khan on 07/05/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State var showModel = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
            
            .navigationBarTitle("Coffee Orders")
            
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus").foregroundColor(Color.white)
                })
        }
        .sheet(isPresented: self.$showModel) {
            AddCoffeeOrderView(isPresented: self.$showModel)
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModel = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
