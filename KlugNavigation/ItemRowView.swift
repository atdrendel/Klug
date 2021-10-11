import SwiftUI

class ItemRowViewModel: Identifiable, ObservableObject {
    @Published var item: Item
    @Published var itemToDelete: Item?
    var id: Item.ID { self.item.id }
    
    init(
        item: Item,
        itemToDelete: Item? = nil
    ) {
        self.item = item
        self.itemToDelete = itemToDelete
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
                //              viewModel.deleteButtonTapped(item: viewModel.item)
                
            } label: {
                Image(systemName: "trash.fill")
            }
            .padding(.leading)
            
        }
        .buttonStyle(.plain)
        .foregroundColor(viewModel.item.status.isInStock ? nil : Color.gray)
    }
}
