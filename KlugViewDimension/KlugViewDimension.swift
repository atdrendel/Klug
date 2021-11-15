import SwiftUI
import Klug

struct KlugViewDimension: View {
    var body: some View {
        VStack {
            
//            MeasureBehavior(
//                Rectangle()
//                    .rotation(.degrees(45))
//                    .fill(Color.red)
//                    .clipped()
//                    .frame(width: 100, height: 100)
//            )
//
//            MeasureBehavior(
//                Rectangle()
//                    .rotation(.degrees(45))
//                    .fill(Color.red)
//                    .mask(Circle())
//            )
//
//            MeasureBehavior(
//                Rectangle()
//                    .fill(Color.red)
//                    .mask(Capsule())
//            )
            
//            MeasureBehavior(
//                HStack {
//                    Text("Hello, World, World")
//                        .layoutPriority(1)
//                        .lineLimit(1)
//                        .truncationMode(.middle)
//                    Rectangle().fill(.blue).frame(minWidth: 50)
//                }
//
//            )
            
//            MeasureBehavior(
//                HStack(spacing: 0) {
//                Text("some text some text some text some text some text").truncationMode(.middle).lineLimit(1)
//                Text("chapter1.md").layoutPriority(1)
//                }
//            )
            
            MeasureBehavior(
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(minWidth: 50)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(maxWidth: 100)
                        .layoutPriority(1)
                }.frame(width: 75)
            )

        }
    }
}

struct KlugViewDimension_Previews: PreviewProvider {
    static var previews: some View {
        KlugViewDimension()
    }
}
