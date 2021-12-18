import SwiftUI
import CasePaths

struct ColorPickerView: View {
  @Binding var color: Item.Color?

  var body: some View {
      Form {
        Button(action: { self.color = nil }) {
          HStack {
            Text("None")
            Spacer()
            if self.color == nil {
              Image(systemName: "checkmark")
            }
          }
        }

        Section(header: Text("Default colors")) {
          ForEach(Item.Color.defaults, id: \.name) { color in
            Button(action: { self.color = color }) {
              HStack {
                Text(color.name)
                Spacer()
                if self.color == color {
                  Image(systemName: "checkmark")
                }
              }
            }
          }
        }
      }
  }
}

struct ItemView: View {
    //2-way communication
    @Binding var item: Item
    @State var nameIsDuplicate = false
    
    var body: some View {
        Form {
            TextField("Name", text: self.$item.name)
                .background(self.nameIsDuplicate ? .red.opacity(0.1) : .clear)
                .onChange(of: self.item.name) { newName in
                    //TODO: Validation Logic
                    Task { @MainActor in
                        await Task.sleep(NSEC_PER_MSEC * 300)
                        self.nameIsDuplicate = newName == "Keyboard"
                    }
                   
                }
            
            NavigationLink(
              destination: ColorPickerView(color: self.$item.color)
            ) {
              HStack {
                Text("Color")
                Spacer()
                Text(self.item.color?.name ?? "None")
                  .foregroundColor(.gray)
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
//        .toolbar {
//            ToolbarItem(placement: .cancellationAction) {
//                Button("Cancel") {
//                    // self.onCancel()
//                }
//            }
//            ToolbarItem(placement: .primaryAction) {
//                Button("Save") {
//                    //  self.onSave(self.item)
//                }
//            }
//        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemView(item: .init(
                projectedValue: .constant(.init(name: "", color: .red, status: .inStock(quantity: 2)))
               )
            )
        }
    }
}
