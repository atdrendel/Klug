import SwiftUI

struct GridView: View {
    var body: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 50))]) {
            ForEach(.init(0...15)) { _ in
                Rectangle().frame(height: 50)
            }
        }
        .frame(width: 400)
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
