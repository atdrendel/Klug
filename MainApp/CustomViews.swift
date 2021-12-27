import SwiftUI

struct CustomViews: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .circle()
            
            CircleWrapper {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
            Text("Hello")
                .padding(10)
                .background(Color.gray)
                .badge(count: 5)
            
        }
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
            
    }
}


extension View {
    func circle(foreground: Color = .white, background: Color = .blue)
    -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(self.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct CircleWrapper<Content: View>: View {
    var foreground, background: Color
    var content: Content
    init(foreground: Color = .white,
         background: Color = .blue,
         @ViewBuilder content: () -> Content)
    {
        self.foreground = foreground
        self.background = background
        self.content = content()
    }
    var body: some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct CircleModifier: ViewModifier {
    var foreground = Color.white
    var background = Color.blue
    func body(content: Content) -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}


extension View {
    func badge(count: Int) -> some View {
        overlay(
            ZStack {
                if count != 0 {
                    Circle()
                        .fill(Color.red)
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
            .offset(x: 12, y: -12)
            .frame(width: 24, height: 24)
        , alignment: .topTrailing)
    }
}
