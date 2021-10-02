import UIKit
import SwiftUI

public enum NettView {
    case logo
    case button(top: UIView, constant: CGFloat = 32)
}

public extension Image {
    static let apple = Image("Social/apple",bundle: .module)
    static let google = Image("Social/google",bundle: .module)
}

public extension String {
    static let next = "Next"
    static let signup = "Sign up"
    static let signin = "Sign in"
    static let apple = "Apple"
    static let google = "Google"
}

struct MeasureBehavior<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    var content: Content
    var body: some View {
        VStack {
            content
                .border(Color.gray)
                .frame(width: width, height: height)
                .border(Color.black)
            Slider(value: $width, in: 0...500)
            Slider(value: $height, in: 0...200)
        }
    }
}

public extension View {
     func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}


