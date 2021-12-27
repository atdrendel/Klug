import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            
            context.draw(
                .init("DesignCode").font(.largeTitle.weight(.bold)),
                at: .init(x: 50, y: 20)
            )
            
            context.fill(
                .init(ellipseIn: .init(x: 20, y: 30, width: 100, height: 100)),
                with: .color(.pink)
            )
            
            context.draw(
                .init("Blob 1"),
                in: .init(x: 0, y: 0, width: 200, height: 200)
            )
            
            context.draw(
                .init(systemName: "hexagon.fill"),
                in: .init(x: 0, y: 0, width: size.width, height: size.height)
            )
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonViewPreview: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
