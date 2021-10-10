import SwiftUI

struct ItemView: View {
    @State var item = Item(name: "", color: nil, status: .inStock(quantity: 1))
    
    var body: some View {
        Form {
            TextField("Name", text: self.$item.name)
            
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
