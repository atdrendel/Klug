import SwiftUI
import IdentifiedCollections
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

extension Item {
    func duplicate() -> Self {
        .init(name: self.name, color: self.color, status: self.status)
    }
}


//view models always holds states and actions
class InventoryViewModel: ObservableObject {
    @Published var inventory: IdentifiedArrayOf<ItemRowViewModel>
    @Published var itemToAdd: Item?
    
    init(inventory: IdentifiedArrayOf<ItemRowViewModel> = [],
         itemToAdd: Item? = nil
    ) {
        self.inventory = inventory
        self.itemToAdd = itemToAdd
        for itemRowViewModel in inventory {
            self.bind(itemRowViewModel: itemRowViewModel)
        }
    }
    
    func delete(item: Item) {
        withAnimation {
            _ = self.inventory.remove(id: item.id)
        }
    }
    
    private func bind(itemRowViewModel: ItemRowViewModel) {
        itemRowViewModel.onDelete = { [weak self, id = itemRowViewModel.id] in
            _ = withAnimation {
                self?.inventory.remove(id: id)
            }
        }
        itemRowViewModel.onDuplicate = { [weak self] item in
            withAnimation {
                self?.add(item: item)
            }
        }
        self.inventory.append(itemRowViewModel)
    }
    
    func add(item: Item) {
        withAnimation {
            let viewModel = ItemRowViewModel(item: item)
            viewModel.onDelete = { [weak self] in
                self?.delete(item: item)
            }
            self.inventory.append(viewModel)
            self.itemToAdd = nil
        }
    }
    
    func cancelButtonTapped() {
        self.itemToAdd = nil
    }
    
    func addButtonTapped() {
        self.itemToAdd = .init(name: "", color: nil, status: .inStock(quantity: 1))
    }
}

struct InventoryView: View {
    @ObservedObject var viewModel: InventoryViewModel
    
    var body: some View {
        List {
            //short form with object/item infered $0
            ForEach(viewModel.inventory, content: ItemRowView.init(viewModel:))
        }
        //        .alert(
        //            title: { Text($0.name) },
        //            presenting: self.$viewModel.itemToDelete,
        //            actions: { item in
        //                Button("Delete", role: .destructive) {
        //                    self.viewModel.delete(item: item)
        //                }
        //            },
        //            message: { _ in
        //                Text("Are you sure you want to delete this item?")
        //            }
        //        )
        //        .toolbar {
        //            ToolbarItem(placement: .primaryAction) {
        //                Button("Add") {
        //                    self.viewModel.addButtonTapped()
        //                }
        //            }
        //        }
        .navigationTitle("Inventory")
        .sheet(unwrap: self.$viewModel.itemToAdd) { $item in
            NavigationView {
                ItemView(item: $item)
                    .navigationBarTitle("Add")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                self.viewModel.cancelButtonTapped()
                            }
                        }
                        ToolbarItem(placement: .primaryAction) {
                            Button("Add") {
                                self.viewModel.add(item: item)
                            }
                        }
                    }
            }
        }
        
        //        .alert(item: $viewModel.itemToDelete) { item in
        //            //We can use an enum to switch various alerts
        //            //SwiftUI has a bug which only calls the last alert if you chain multiples
        //            Alert(
        //                title: Text(item.name),
        //                message: Text("Are you sure you want to delete this item?"),
        //                primaryButton: .destructive(Text("Delete")) {
        //                    viewModel.delete(item: item)
        //                },
        //                secondaryButton: .cancel()
        //            )
        //        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        let keyboard = Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100))
        NavigationView {
            InventoryView(
                viewModel: .init(
                    inventory: [
                        .init(item: keyboard),
                        .init(item: Item(name: "Charger", color: .yellow, status: .inStock(quantity: 20))),
                        .init(item: Item(name: "Phone", color: .green, status: .outOfStock(isOnBackOrder: true))),
                        .init(item: Item(name: "Headphones", color: .green, status: .outOfStock(isOnBackOrder: false))),
                    ],
                    itemToAdd: keyboard
                )
            )
        }
    }
}

// ForEach.init:   (Binding<C>,  (Binding<C.Element>) -> some View) -> ForEach
// sheet(unwrap:): (Binding<V?>, (Binding<V>)         -> some View) -> some View
