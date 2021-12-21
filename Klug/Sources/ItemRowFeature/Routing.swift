import Foundation
import Models
import Parsing
import ParsingHelpers

public enum ItemRowRoute {
    case delete
    case duplicate
    case edit
}

public let itemRowDeepLinker = PathComponent("edit")
    .skip(PathEnd())
    .map { _ in ItemRowRoute.edit }
    .orElse(
        PathComponent("delete")
            .skip(PathEnd())
            .map { _ in .delete }
    )
    .orElse(
        PathComponent("duplicate")
            .skip(PathEnd())
            .map { _ in .duplicate }
    )

extension ItemRowViewModel {
    public func navigate(to route: ItemRowRoute) {
        switch route {
        case .delete:
            self.route = .deleteAlert
        case .duplicate:
            self.route = .duplicate(.init(item: self.item))
        case .edit:
            self.route = .edit(.init(item: self.item))
        }
    }
}
