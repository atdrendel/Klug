import UIKit

protocol Relative {
    associatedtype Body: Relative
    var body: Body { get }
}

typealias RenderingContext = CGContext
typealias ProposedSize = CGSize

// we avount calling body on every RelativeView
extension Relative where Body == Never {
    var body: Never { fatalError("This should never be called.") }
}

protocol RelativeView {
    func render(context: RenderingContext, size: ProposedSize)
    typealias Body = Never
}

extension Never: Relative {
    typealias Body = Never
}

protocol RelativeShape {
    func path(in: CGRect) -> CGPath
}

struct RelativeShapeView<S: RelativeShape>: RelativeView, Relative {
    var shape: S
    func render(context: RenderingContext, size: ProposedSize) {
        context.saveGState()
        context.setFillColor(UIColor.red.cgColor)
        context.addPath(shape.path(in: .init(origin: .zero, size: size)))
        context.fillPath()
        context.restoreGState()
    }
}

extension Relative {
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
