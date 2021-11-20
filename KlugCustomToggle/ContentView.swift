import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
            VStack {
                Text("Customize")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Choose your default appearance.")
                    .foregroundColor(.gray)
                    .font(.body)
                
                ZStack {
                    Capsule()
                        .frame(width: 80, height: 44)
                        .foregroundColor(.blue)
                    Circle()
                        .frame(width: 40, height: 44)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                        .offset(x: -18)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
