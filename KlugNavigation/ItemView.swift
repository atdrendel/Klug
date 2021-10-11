import SwiftUI
import CasePaths

class ItemRowViewModel: Identifiable, ObservableObject {
  @Published var item: Item

    var id: Item.ID { self.item.id }
    
  init(item: Item) {
    self.item = item
  }
}

struct ItemView: View {
    //2-way communication
    @Binding var item: Item
    
//    let onSave: (Item) -> Void
//    let onCancel: () -> Void
    
    //  init(
    //    item: Item,
    //    onSave: @escaping (Item) -> Void,
    //    onCancel: @escaping () -> Void
    //  ) {
    //    print("ItemView.init", item.name)
    //    self._item = .init(wrappedValue: item)
    //    self.onSave = onSave
    //    self.onCancel = onCancel
    //  }
    
    var body: some View {
        Form {
            TextField("Name", text: self.$item.name)
            
            Picker(selection: self.$item.color, label: Text("Color")) {
                Text("None")
                    .tag(Item.Color?.none)
                
                ForEach(Item.Color.defaults, id: \.name) { color in
                    Text(color.name)
                        .tag(Optional(color))
                }
            }
            
            IfCaseLet(self.$item.status, pattern: /Item.Status.inStock) { $quantity in
              Section(header: Text("In stock")) {
                Stepper("Quantity: \(quantity)", value: $quantity)
                Button("Mark as sold out") {
                  self.item.status = .outOfStock(isOnBackOrder: false)
                }
              }
            }
            IfCaseLet(self.$item.status, pattern: /Item.Status.outOfStock) { $isOnBackOrder in
              Section(header: Text("Out of stock")) {
                Toggle("Is on back order?", isOn: $isOnBackOrder)
                Button("Is back in stock!") {
                  self.item.status = .inStock(quantity: 1)
                }
              }
            }
            
       
        }
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
              self.onCancel()
            }
          }
          ToolbarItem(placement: .primaryAction) {
            Button("Save") {
              self.onSave(self.item)
            }
          }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemView(
                item: .constant(Item(name: "", color: nil, status: .inStock(quantity: 1))),
                onSave: { _ in },
                onCancel: { })
        }
        
    }
}
