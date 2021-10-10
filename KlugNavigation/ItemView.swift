import SwiftUI

struct ItemView: View {
    @State var item = Item(name: "", color: nil, status: .inStock(quantity: 1))
    
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
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
