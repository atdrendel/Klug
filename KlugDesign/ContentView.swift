import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
            .fontWeight(.bold)
            
            Text("20 sections - 3 hours")
                .font(.footnote)
                .fontWeight(.semibold)
            Text(/*@START_MENU_TOKEN@*/"Build an iOS app for iOS 15 with custom layouts, animations and ..."/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
