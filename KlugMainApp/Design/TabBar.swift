import SwiftUI

struct TabBar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
  
            AccountView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                VStack {
                        Image(systemName: "house")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        Text("Learn Now")
                        .font(.caption2)
                }
                
                VStack {
                        Image(systemName: "magnifyingglass")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        Text("Explore")
                        .font(.caption2)
                }
                Spacer()
            }
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .strokeStyle()
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
