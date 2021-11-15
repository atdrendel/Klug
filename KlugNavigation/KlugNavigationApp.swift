import SwiftUI

@main
struct KlugNavigationApp: App {
    var body: some Scene {
        let keyboard = Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100))
        
        var editedKeyBoard = keyboard
        editedKeyBoard.name = "Bluetooth Keyboard"
        editedKeyBoard.status = .inStock(quantity: 1000)

      return WindowGroup {
          NavigationContentView(
          viewModel: .init(
            inventoryViewModel: .init(
              inventory: [
                .init(item: keyboard, route: .edit(editedKeyBoard)),
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
