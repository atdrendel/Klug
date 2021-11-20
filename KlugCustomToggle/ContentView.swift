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
                        .foregroundColor(.init("capsule"))
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 44)
                            .foregroundColor(.white)
                        
                        Image(systemName: "moon.fill")
                            .renderingMode(.template)
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x: -18)
                    .padding(24)
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
