import SwiftUI

struct HueView: View {
    @State var change = false
    var body: some View {
        VStack {
            // Hue Saturation
            Circle()
                .fill(.pink)
                .hueRotation(.init(degrees: change ? 170 : 0))
                .frame(width: 50)
                .animation(.easeInOut, value: change)
                .onTapGesture {
                    change.toggle()
                }

            //Offset
            Circle()
                .fill(.blue)
                .hueRotation(.init(degrees: change ? 170 : 0))
                .frame(width: 50)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.default, value: change)
        }
    }
}

struct HueViewPreview: PreviewProvider {
    static var previews: some View {
        HueView()
    }
}
