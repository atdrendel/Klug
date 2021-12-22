import SwiftUI

struct MatchedGeometryEffect: View {
    @State var state = false
    
    var body: some View {
        Text("")
    }
}

struct AnimatedButton: View {
    @State var selected: Bool = false
    var body: some View {
        Button(action: { self.selected.toggle() }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: selected ? 100 : 50, height: 50)
        }.animation(.linear(duration: 5), value: selected)
    }
}

struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton()
    }
}
