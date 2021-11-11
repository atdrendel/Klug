import SwiftUI

@main
struct KlugNavigationApp: App {
    var body: some Scene {
      let keyboard = Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100))

      WindowGroup {
        ContentView(
          viewModel: .init(
            inventoryViewModel: .init(
              inventory: [
                .init(item: keyboard, route: .deleteAlert),
                .init(item: Item(name: "Charger", color: .yellow, status: .inStock(quantity: 20))),
                .init(item: Item(name: "Phone", color: .green, status: .outOfStock(isOnBackOrder: true))),
                .init(item: Item(name: "Headphones", color: .green, status: .outOfStock(isOnBackOrder: false))),
              ]
            ),
            selectedTab: .inventory
          )
        )
      }
        
    }
}
