import CasePaths
import ItemFeature
import Models
import SwiftUI

public class ItemRowViewModel: Hashable, Identifiable, ObservableObject {
    @Published public var item: Item
    @Published public var route: Route?
    @Published var isSaving = false

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.item.id)
    }

    public static func == (lhs: ItemRowViewModel, rhs: ItemRowViewModel) -> Bool {
        lhs.item.id == rhs.item.id
    }

    public enum Route: Equatable {
        case deleteAlert
        case duplicate(ItemViewModel)
        case edit(ItemViewModel)

        public static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.deleteAlert, .deleteAlert):
                return true
            case let (.duplicate(lhs), .duplicate(rhs)):
                return lhs === rhs
            case let (.edit(lhs), .edit(rhs)):
                return lhs === rhs
            case (.deleteAlert, _), (.duplicate, _), (.edit, _):
                return false
            }
        }
    }

    public var onDelete: () -> Void = {}
    public var onDuplicate: (Item) -> Void = { _ in }

    public var id: Item.ID { self.item.id }

    public init(
        item: Item
    ) {
        self.item = item
    }

    public func deleteButtonTapped() {
        self.route = .deleteAlert
    }

    func deleteConfirmationButtonTapped() {
        self.onDelete()
        self.route = nil
    }

    public func setEditNavigation(isActive: Bool) {
        self.route = isActive ? .edit(.init(item: self.item)) : nil
    }

     func edit(item: Item) {
        self.isSaving = true

        Task { @MainActor in
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)

            self.isSaving = false
            self.item = item
            self.route = nil
        }
    }

    public func cancelButtonTapped() {
        self.route = nil
    }

    public func duplicateButtonTapped() {
        self.route = .duplicate(.init(item: self.item.duplicate()))
    }

     func duplicate(item: Item) {
        self.onDuplicate(item)
        self.route = nil
    }
}

extension Item {
     public func duplicate() -> Self {
        .init(name: self.name, color: self.color, status: self.status)
    }
}

public struct ItemRowView: View {
    @ObservedObject public var viewModel: ItemRowViewModel
    
    public init(
        viewModel: ItemRowViewModel
    ) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationLink(
            unwrap: self.$viewModel.route,
            case: /ItemRowViewModel.Route.edit,
            onNavigate: self.viewModel.setEditNavigation(isActive:),
            destination: { $itemViewModel in
                ItemView(viewModel: itemViewModel)
                    .navigationBarTitle("Edit")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                self.viewModel.cancelButtonTapped()
                            }
                        }
                        ToolbarItem(placement: .primaryAction) {
                            HStack {
                                if self.viewModel.isSaving {
                                    ProgressView()
                                }
                                Button("Save") {
                                    self.viewModel.edit(item: itemViewModel.item)
                                }
                            }
                            .disabled(self.viewModel.isSaving)
                        }
                    }
            }
        ) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.viewModel.item.name)

                    switch self.viewModel.item.status {
                    case let .inStock(quantity):
                        Text("In stock: \(quantity)")
                    case let .outOfStock(isOnBackOrder):
                        Text("Out of stock" + (isOnBackOrder ? ": on back order" : ""))
                    }
                }

                Spacer()

                if let color = self.viewModel.item.color {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(color.swiftUIColor)
                        .border(Color.black, width: 1)
                }

                Button(action: { self.viewModel.duplicateButtonTapped() }) {
                    Image(systemName: "square.fill.on.square.fill")
                }
                .padding(.leading)

                Button(action: { self.viewModel.deleteButtonTapped() }) {
                    Image(systemName: "trash.fill")
                }
                .padding(.leading)
            }
            .buttonStyle(.plain)
            .foregroundColor(self.viewModel.item.status.isInStock ? nil : Color.gray)
            .alert(
                self.viewModel.item.name,
                isPresented: self.$viewModel.route.isPresent(/ItemRowViewModel.Route.deleteAlert),
                actions: {
                    Button("Delete", role: .destructive) {
                        self.viewModel.deleteConfirmationButtonTapped()
                    }
                },
                message: {
                    Text("Are you sure you want to delete this item?")
                }
            )
            .popover(
                item: self.$viewModel.route.case(/ItemRowViewModel.Route.duplicate)
            ) { itemViewModel in
                NavigationView {
                    ItemView(viewModel: itemViewModel)
                        .navigationBarTitle("Duplicate")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    self.viewModel.cancelButtonTapped()
                                }
                            }
                            ToolbarItem(placement: .primaryAction) {
                                Button("Add") {
                                    self.viewModel.duplicate(item: itemViewModel.item)
                                }
                            }
                        }
                }
                .frame(minWidth: 300, minHeight: 500)
            }
        }
    }
}

struct ItemRowPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ItemRowView(
                    viewModel: .init(
                        item: .init(
                            name: "AirPods",
                            color: .white,
                            status: .inStock(quantity: 15)
                        )
                    )
                )
            }
        }
    }
}
