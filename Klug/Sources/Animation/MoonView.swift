import SwiftUI

// SVG
struct MoonView: View {

  static let intrinsicSize = CGSize(width: 19, height: 19)

  // Nested Groups and Shapes

  struct PathView1: View { // SVGPath

    struct PathShape1: Shape {

      func path(in rect: CGRect) -> Path {
        Path { path in
          path.move(to: CGPoint(x: 13.5, y: 13))
          path.addCurve(to: CGPoint(x: 6, y: 5.5),
                        control1: CGPoint(x: 9.3578, y: 13),
                        control2: CGPoint(x: 6, y: 9.6421))
          path.addCurve(to: CGPoint(x: 7.0837, y: 1.6143),
                        control1: CGPoint(x: 6, y: 4.0776),
                        control2: CGPoint(x: 6.396, y: 2.7476))
          path.addCurve(to: CGPoint(x: 6.53, y: 0.812),
                        control1: CGPoint(x: 7.336, y: 1.1986),
                        control2: CGPoint(x: 6.983, y: 0.6352))
          path.addCurve(to: CGPoint(x: 0.8007, y: 9.1993),
                        control1: CGPoint(x: 3.1766, y: 2.1207),
                        control2: CGPoint(x: 0.8007, y: 5.3825))
          path.addCurve(to: CGPoint(x: 9.8007, y: 18.1993),
                        control1: CGPoint(x: 0.8007, y: 14.1698),
                        control2: CGPoint(x: 4.8301, y: 18.1993))
          path.addCurve(to: CGPoint(x: 18.188, y: 12.47),
                        control1: CGPoint(x: 13.6175, y: 18.1993),
                        control2: CGPoint(x: 16.8793, y: 15.8234))
          path.addCurve(to: CGPoint(x: 17.3857, y: 11.9162),
                        control1: CGPoint(x: 18.3648, y: 12.0169),
                        control2: CGPoint(x: 17.8014, y: 11.6639))
          path.addCurve(to: CGPoint(x: 13.5, y: 13),
                        control1: CGPoint(x: 16.2524, y: 12.604),
                        control2: CGPoint(x: 14.9224, y: 13))
          path.closeSubpath()
        }
       
      }
    }
    
      @State var rotate = false
    var body: some View {
     
      PathShape1()
            .fill(rotate ? .blue : .purple)
        .rotationEffect(.degrees(rotate ? 360 : 0))
        .task {
            withAnimation(
                .spring(response: 0.90, dampingFraction: 0.22)
                    .repeatForever()) {
                rotate.toggle()
            }
            
        }
    }
  }

  var isResizable = false
  func resizable() -> Self { Self(isResizable: true) }

  var body: some View {
    if isResizable {
      GeometryReader { proxy in
        PathView1()
          .frame(width: 19, height: 19,
                 alignment: .topLeading)
          .scaleEffect(x: proxy.size.width  / 19,
                       y: proxy.size.height / 19)
          .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
    else {
      PathView1()
        .frame(width: 19, height: 19)
    }
  }
}

struct MoonView_Previews: PreviewProvider {

  static var previews: some View {
    VStack {
        MoonView()
        .resizable()
        .frame(width  : 12 * MoonView.intrinsicSize.width,
               height : 12 * MoonView.intrinsicSize.height)
      //  .background(Color.clear.border(Color.green))
        .padding()
    //  Text("Size: 19.0x19.0").padding(.bottom)
    }
  }
}
