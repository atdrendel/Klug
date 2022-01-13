import UIKit

protocol Relative {
    associatedtype Body: Relative
    var body: Body { get }
}

typealias RenderingContext = CGContext
typealias ProposedSize = CGSize

extension Relative {
    func _render(
        context: RenderingContext
        size: ProposedSize
    ) {
        body._render(context: context, size: size)
    }
}
