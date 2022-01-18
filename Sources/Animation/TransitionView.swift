import SwiftUI


struct TransitionView: View {
    @State var visible = false
    var body: some View {
        VStack {
            Button("Toggle") { self.visible.toggle() }
            if visible {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
                    .animation(.spring(), value: visible)
            }
        }
    }
}

struct TransitionView_Provider: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
