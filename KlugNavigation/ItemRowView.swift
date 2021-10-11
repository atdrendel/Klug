import SwiftUI

class ItemRowViewModel: Identifiable, ObservableObject {
    
    var id: Item.ID { self.item.id }
    @Published var deleteItemAlertIsPresented: Bool
    @Published var item: Item
    var onDelete: () -> Void = { }

    
    init(
        deleteItemAlertIsPresented: Bool = false,
        item: Item
    ) {
        self.deleteItemAlertIsPresented = deleteItemAlertIsPresented
        self.item = item
    }
    
    func deleteButtonTapped() {
      self.deleteItemAlertIsPresented = true
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
          isPresented: self.$viewModel.deleteItemAlertIsPresented,
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
