import CasePaths
import Models
import SwiftUI
import SwiftUIHelpers

struct ColorPickerView: View {
    @ObservedObject var viewModel: ItemViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Button(action: {
                self.viewModel.item.color = nil
                self.dismiss()
            }) {
                HStack {
                    Text("None")
                    Spacer()
                    if self.viewModel.item.color == nil {
                        Image(systemName: "checkmark")
                    }
                }
            }

            Section(header: Text("Default colors")) {
                ForEach(Item.Color.defaults, id: \.name) { color in
                    Button(action: {
                        self.viewModel.item.color = color
                        self.dismiss()
                    }) {
                        HStack {
                            Text(color.name)
                            Spacer()
                            if self.viewModel.item.color == color {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }

            if !self.viewModel.newColors.isEmpty {
                Section(header: Text("New colors")) {
                    ForEach(self.viewModel.newColors, id: \.name) { color in
                        Button(action: {
                            self.viewModel.item.color = color
                            self.dismiss()
                        }) {
                            HStack {
                                Text(color.name)
                                Spacer()
                                if self.viewModel.item.color == color {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            await self.viewModel.loadColors()
        }
    }
}

public class ItemViewModel: Identifiable, ObservableObject {
    @Published public var item: Item
    @Published public var nameIsDuplicate = false
    @Published public var newColors: [Item.Color] = []
    @Published public var route: Route?

    public var id: Item.ID { self.item.id }

    public enum Route {
        case colorPicker
    }

    public init(item: Item, route: Route? = nil) {
        self.item = item
        self.route = route

        Task { @MainActor in
            for await item in self.$item.values {
                try await Task.sleep(nanoseconds: NSEC_PER_MSEC * 300)
                self.nameIsDuplicate = item.name == "Keyboard"
            }
        }
    }

    @MainActor
    public func loadColors() async {
        try? await Task.sleep(nanoseconds: NSEC_PER_MSEC * 500)
        self.newColors = [
            .init(name: "Pink", red: 1, green: 0.7, blue: 0.7),
        ]
    }

    public func setColorPickerNavigation(isActive: Bool) {
        self.route = isActive ? .colorPicker : nil
    }
}

public struct ItemView: View {
    @ObservedObject var viewModel: ItemViewModel
    
    public init(
        viewModel: ItemViewModel
    ) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Form {
            TextField("Name", text: self.$viewModel.item.name)
                .background(self.viewModel.nameIsDuplicate ? Color.red.opacity(0.1) : Color.clear)

            NavigationLink(
                unwrap: self.$viewModel.route,
                case: /ItemViewModel.Route.colorPicker,
                onNavigate: self.viewModel.setColorPickerNavigation(isActive:),
                destination: { _ in ColorPickerView(viewModel: self.viewModel) }
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

            IfCaseLet(self.$viewModel.item.status, pattern: /Item.Status.inStock) { $quantity in
                Section(header: Text("In stock")) {
                    Stepper("Quantity: \(quantity)", value: $quantity)
                    Button("Mark as sold out") {
                        self.viewModel.item.status = .outOfStock(isOnBackOrder: false)
                    }
                }
            }
            IfCaseLet(self.$viewModel.item.status, pattern: /Item.Status.outOfStock) { $isOnBackOrder in
                Section(header: Text("Out of stock")) {
                    Toggle("Is on back order?", isOn: $isOnBackOrder)
                    Button("Is back in stock!") {
                        self.viewModel.item.status = .inStock(quantity: 1)
                    }
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemView(
                viewModel: .init(
                    item: Item(name: "", color: nil, status: .inStock(quantity: 1))
                )
            )
        }
    }
}
