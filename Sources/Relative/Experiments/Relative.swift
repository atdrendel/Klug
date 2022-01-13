import UIKit

public protocol Relative {
    associatedtype Body: Relative
    var body: Body { get }
}

public typealias RenderingContext = CGContext
public typealias ProposedSize = CGSize

// we avount calling body on every RelativeView
extension Relative where Body == Never {
    public var body: Never { fatalError("This should never be called.") }
}

public protocol RelativeView {
    func render(context: RenderingContext, size: ProposedSize)
     typealias Body = Never
}

extension Never: Relative {
    public typealias Body = Never
}

public protocol RelativeShape {
    func path(in rect: CGRect) -> CGPath
}

public struct RelativeShapeView<S: RelativeShape>: RelativeView, Relative {
    var shape: S
    public init(shape: S) {
        self.shape = shape
    }
    public func render(context: RenderingContext, size: ProposedSize) {
        context.saveGState()
        context.setFillColor(UIColor.red.cgColor)
        context.addPath(shape.path(in: .init(origin: .zero, size: size)))
        context.fillPath()
        context.restoreGState()
    }
}

public class RelativeRectangle: RelativeShape {
    public init(){}
    public func path(in rect: CGRect) -> CGPath {
        .init(rect: rect, transform: nil)
    }
}

public extension Relative {
    func _render(
        context: RenderingContext,
        size: ProposedSize
    ) {
        if let builtin = self as? RelativeView {
            builtin.render(context: context, size: size)
        } else {
            body._render(context: context, size: size)
        }
    }
}
