import SwiftUI
import Klug

struct ContentView: View {
    
    @State var toggleOn = false
    
    var body: some View {
        ZStack {
            Color(toggleOn ? .black : .purple)
                .opacity(toggleOn ? 1 : 0.2)
            VStack {
                
                Text("Customize")
                    .foregroundColor(toggleOn ? .white : .black)
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack{
                    Image("illustrationLight")
                        .opacity(toggleOn ? 1 : 0)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 0 : -180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    Image("illustrationDark")
                        .opacity(toggleOn ? 0 : 1)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 180 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }.padding(24)
                
                
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
                        
                        Image(systemName: toggleOn ? "moon.fill" : "sun.max.fill")
                            .renderingMode(.template)
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x: toggleOn ? 18 : -18)
                    .padding(24)
                }
                .onTapGesture {
                    withAnimation(.spring(response: 0.60,dampingFraction: 0.5)) {
                        self.toggleOn.toggle()
                    }
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
        }
    }
}
