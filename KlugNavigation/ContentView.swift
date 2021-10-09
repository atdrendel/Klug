//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

enum Tab {
  case one, inventory, three
}

class AppViewModel: ObservableObject {
  @Published var inventoryViewModel: InventoryViewModel
  @Published var selectedTab: Tab

  init(
    inventoryViewModel: InventoryViewModel = .init(),
    selectedTab: Tab = .one
  ) {
    self.inventoryViewModel = inventoryViewModel
    self.selectedTab = selectedTab
  }

 
}

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
    
            TabView(selection: $viewModel.selectedTab) {
                
                VStack {
                  Text("One")
                  Button("Go to 2nd tab") { self.viewModel.selectedTab = .inventory }
                }
                .tabItem { Text("One") }
                .tag(Tab.one)
                
                InventoryView(viewModel: self.viewModel.inventoryViewModel)
                  .tabItem { Text("Two") }
                  .tag(Tab.inventory)
                
                Text("Three")
                    .tabItem { Text("Three") }
                    .tag(Tab.three)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let keyboard = Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100))
        
        ContentView(
            viewModel: .init(
                inventoryViewModel: .init(
                    inventory: [
                        keyboard,
                        Item(name: "Charger", color: .yellow, status: .inStock(quantity: 20)),
                        Item(name: "Phone", color: .green, status: .outOfStock(isOnBackOrder: true)),
                        Item(name: "Headphones", color: .green, status: .outOfStock(isOnBackOrder: false)),
                    ],
                    itemToDelete: keyboard
                ),
                selectedTab: .inventory
            )
        )
    }
}
