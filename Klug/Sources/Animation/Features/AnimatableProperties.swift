import Klug
import SwiftUI

struct HueView: View {
    @State var change = false
    var body: some View {
        HStack {
            // animate alignment
            Text("Animate Text Alignment")
                .multilineTextAlignment(change ?
                    .trailing : .leading)
                .frame(width: .infinity)
            
            // Hue Saturation
            Circle()
                .fill(.pink)
                .hueRotation(.init(degrees: change ? 170 : 0))
                .frame(width: 50)
                .animation(.easeInOut, value: change)
                .onTapGesture {
                    change.toggle()
                }
            
            // Offset
            Circle()
                .fill(.blue)
                .hueRotation(.init(degrees: change ? 170 : 0))
                .frame(width: 50)
                // .offset(x: change ? 140 : -140, y: 0)
                .animation(.default, value: change)
            //            Spacer()
        }
    }
}

struct Animate_Alignment: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: change ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default, value: change)
                HStack {
                    Spacer()
                }
            }
            
            HStack(alignment: change ? .bottom : .top) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default, value: change)
                VStack {
                    Spacer()
                }
            }.frame(maxHeight: .infinity)
            
            Button("Change") {
                change.toggle()
            }
            
            GeometryReader { gp in
                RoundedRectangle(cornerRadius:20)
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .position(change ? CGPoint(x: 50, y: 50) : CGPoint(x: gp.size.width - 50, y: gp.size.height - 50))
                .animation(.default, value: change)
            }
        }.font(.title)
    }
}

struct HueViewPreview: PreviewProvider {
    static var previews: some View {
        Animate_Alignment()
    }
}
