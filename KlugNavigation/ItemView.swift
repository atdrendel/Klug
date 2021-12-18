import CasePaths
import SwiftUI

struct ColorPickerView: View {
    @Binding var color: Item.Color?
    @Environment(\.dismiss) var dismiss
    @State var newColors: [Item.Color] = []

    var body: some View {
        Form {
            Button(action: {
                self.color = nil
                self.dismiss()
            }) {
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
                    Button(action: {
                        self.color = color
                        self.dismiss()
                    }) {
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

            if !self.newColors.isEmpty {
                Section(header: Text("New colors")) {
                    ForEach(self.newColors, id: \.name) { color in
                        Button(action: {
                            self.color = color
                            self.dismiss()
                        }) {
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
        .task {
            await Task.sleep(NSEC_PER_MSEC * 500)
            self.newColors = [
                .init(name: "Pink", red: 1, green: 0.7, blue: 0.7)
            ]
        }
    }
}

class ItemViewModel: Identifiable, ObservableObject {
    @Published var item: Item

    var id: Item.ID { self.item.id }
    init(item: Item) {
        self.item = item
    }
}

struct ItemView: View {
    // 2-way communication
    @ObservedObject var viewModel: ItemViewModel
    @State var nameIsDuplicate = false

    var body: some View {
        Form {
            TextField("Name", text: self.viewModel.$item.name)
                .background(self.nameIsDuplicate ? .red.opacity(0.1) : .clear)
                .onChange(of: self.viewModel.item.name) { newName in
                    // TODO: Validation Logic
                    Task { @MainActor in
                        await Task.sleep(NSEC_PER_MSEC * 300)
                        self.nameIsDuplicate = newName == "Keyboard"
                    }
                }

            NavigationLink(
                destination: ColorPickerView(color: self.viewModel.$item.color)
            ) {
                HStack {
                    Text("Color")
                    Spacer()
                    if let color = self.viewModel.item.color {
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(color.swiftUIColor)
                            .border(Color.black, width: 1)
                    }
                    Text(self.viewModel.item.color?.name ?? "None")
                        .foregroundColor(.gray)
                }
            }

            IfCaseLet(self.viewModel.$item.status, pattern: /Item.Status.inStock) { $quantity in
                Section(header: Text("In stock")) {
                    Stepper("Quantity: \(quantity)", value: $quantity)
                    Button("Mark as sold out") {
                        self.viewModel.item.status = .outOfStock(isOnBackOrder: false)
                    }
                }
            }

            IfCaseLet(self.viewModel.$item.status, pattern: /Item.Status.outOfStock) { $isOnBackOrder in
                Section(header: Text("Out of stock")) {
                    Toggle("Is on back order?", isOn: $isOnBackOrder)
                    Button("Is back in stock!") {
                        self.viewModel.item.status = .inStock(quantity: 1)
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
      ItemView(viewModel: .init(item: .init(name: "", color: nil, status: .inStock(quantity: 1))))
    }
  }
}
