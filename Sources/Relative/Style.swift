import Foundation
import SwiftUI

public protocol Style {
    init()
}
extension NSObject: Style {}
public extension Style where Self: AnyObject {
  //  @inlinable
    init(_ block: (Self) -> Void) {
        self.init()
        block(self)
    }
}



public extension PreviewLayout {
    static func canvas() -> PreviewLayout {
        .fixed(width: 320, height: 307)
    }
}


