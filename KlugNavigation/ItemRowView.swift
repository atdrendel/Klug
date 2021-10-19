import SwiftUI

class ItemRowViewModel: Identifiable, ObservableObject {
    
    var id: Item.ID { self.item.id }
//    @Published var deleteItemAlertIsPresented: Bool
    @Published var item: Item
//    @Published var itemToEdit: Item?
//    @Published var itemToDuplicate: Item?
    
    var onDelete: () -> Void = { }
    
    @Published var route: Route?

     enum Route {
       case deleteAlert
       case duplicate(Item)
       case edit(Item)
     }

    
    init(
      item: Item,
      route: Route? = nil
    ) {
      self.item = item
      self.route = route
    }
    
    func deleteButtonTapped() {
      self.route = .deleteAlert
    }
    
    func deleteConfirmationButtonTapped() {
        self.onDelete()
    }
    
}

struct ItemRowView: View {
    @ObservedObject var viewModel: ItemRowViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.item.name)
                
                switch viewModel.item.status {
                case let .inStock(quantity):
                    Text("In stock: \(quantity)")
                case let .outOfStock(isOnBackOrder):
                    Text("Out of stock" + (isOnBackOrder ? ": on back order" : ""))
                }
            }
            
            Spacer()
            
            if let color = viewModel.item.color {
                Rectangle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color.swiftUIColor)
                    .border(Color.black, width: 1)
            }
            
            Button {
                viewModel.deleteButtonTapped()
            } label: {
                Image(systemName: "trash.fill")
            }
            .padding(.leading)
            
        }
        .buttonStyle(.plain)
        .foregroundColor(viewModel.item.status.isInStock ? nil : Color.gray)
        .alert(
          self.viewModel.item.name,
          isPresented: Binding(
            get: {
              if case .some(.deleteAlert) = self.viewModel.route {
                return true
              } else {
                return false
              }
            },
            set: { isPresented in
              if !isPresented {
                self.viewModel.route = nil
              }
            }
          ),
          actions: {
            Button("Delete", role: .destructive) {
              self.viewModel.deleteConfirmationButtonTapped()
            }
          },
          message: {
            Text("Are you sure you want to delete this item?")
          }
        )
    }
}
