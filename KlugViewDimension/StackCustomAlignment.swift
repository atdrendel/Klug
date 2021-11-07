import SwiftUI

enum MyCenterID: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.height * 0.5
    }
}

extension VerticalAlignment {
    static let myCenter: VerticalAlignment = .init(MyCenterID.self)
}

struct StackCustomAlignment: View {
    var body: some View {
        HStack(alignment: .myCenter) {
            Rectangle().fill(Color.blue).frame(width: 50, height: 50)
            Rectangle().fill(Color.green).frame(width: 30, height: 30)
        }
    }
}

struct StackCustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        StackCustomAlignment()
    }
}
