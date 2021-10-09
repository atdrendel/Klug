//
//  Inventory.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 07/10/2021.
//

import SwiftUI
import Foundation

struct Item: Equatable, Identifiable {
    let id = UUID()
    var name: String
    var color: Color?
    var status: Status
    
    enum Status: Equatable {
        case inStock(quantity: Int)
        case outOfStock(isOnBackOrder: Bool)
        
        var isInStock: Bool {
            guard case .inStock = self else { return false }
            return true
        }
    }
    
    struct Color: Equatable, Hashable {
        var name: String
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        static var defaults: [Self] = [
            .red,
            .green,
            .blue,
            .black,
            .yellow,
            .white,
        ]
        
        static let red = Self(name: "Red", red: 1)
        static let green = Self(name: "Green", green: 1)
        static let blue = Self(name: "Blue", blue: 1)
        static let black = Self(name: "Black")
        static let yellow = Self(name: "Yellow", red: 1, green: 1)
        static let white = Self(name: "White", red: 1, green: 1, blue: 1)
        
        var swiftUIColor: SwiftUI.Color {
            .init(red: self.red, green: self.green, blue: self.blue)
        }
    }
}


class InventoryViewModel: ObservableObject {
    @Published var inventory: [Item]
    
    init(inventory: [Item] = []) {
        self.inventory = inventory
    }
    
    func delete(at index: Int) {
        withAnimation {
            self.inventory.remove(at: index)
        }
    }
}

struct InventoryView: View {
    @ObservedObject var viewModel: InventoryViewModel
    @State var itemToDelete: Item?
    
    var body: some View {
        List {
            ForEach(Array(zip(self.viewModel.inventory.indices, self.viewModel.inventory)), id: \.1.id) {  index, item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                        
                        switch item.status {
                        case let .inStock(quantity):
                            Text("In stock: \(quantity)")
                        case let .outOfStock(isOnBackOrder):
                            Text("Out of stock" + (isOnBackOrder ? ": on back order" : ""))
                        }
                    }
                    
                    Spacer()
                    
                    if let color = item.color {
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(color.swiftUIColor)
                            .border(Color.black, width: 1)
                    }
                    
                    Button(action: { self.itemToDelete = (index, item) }) {
                        Image(systemName: "trash.fill")
                    }
                    .padding(.leading)
                }
                .buttonStyle(.plain)
                .foregroundColor(item.status.isInStock ? nil : Color.gray)
            }
        }
        .alert(item: $itemToDelete) { index, item in
            //We can use an enum to switch various alerts
            //SwiftUI has a bug which only calls the last alert if you chain multiples
            Alert(
                title: Text(item.name),
                message: Text("Are you sure you want to delete this item?"),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.delete(at: index)
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(
            viewModel: .init(
                inventory: [
                    Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100)),
                    Item(name: "Charger", color: .yellow, status: .inStock(quantity: 20)),
                    Item(name: "Phone", color: .green, status: .outOfStock(isOnBackOrder: true)),
                    Item(name: "Headphones", color: .green, status: .outOfStock(isOnBackOrder: false)),
                ]
            )
        )
    }
}
