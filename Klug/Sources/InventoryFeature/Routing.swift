import Models
import Parsing
import ItemRowFeature
import ParsingHelpers
import Foundation


public enum InventoryRoute {
    case add(Item, ItemRoute? = nil)
    case row(Item.ID, RowRoute)

    public enum RowRoute {
        case delete
        case duplicate
        case edit
    }
}

public enum ItemRoute {
    case colorPicker
}

let item = QueryItem("name").orElse(Always(""))
    .take(QueryItem("quantity", Int.parser()).orElse(Always(1)))
    .map { name, quantity in
        Item(name: String(name), status: .inStock(quantity: quantity))
    }

public let inventoryDeepLinker = PathEnd()
    .map { InventoryRoute?.none }
    .orElse(
        PathComponent("add")
            .skip(PathEnd())
            .take(item)
            .map { .add($0) }
    )
    .orElse(
        PathComponent("add")
            .skip(PathComponent("colorPicker"))
            .skip(PathEnd())
            .take(item)
            .map { .add($0, .colorPicker) }
    )
    .orElse(
        PathComponent(UUID.parser())
            .skip(PathComponent("edit"))
            .skip(PathEnd())
            .map { id in .row(id, .edit) }
    )
    .orElse(
        PathComponent(UUID.parser())
            .skip(PathComponent("delete"))
            .skip(PathEnd())
            .map { id in .row(id, .delete) }
    )

extension InventoryViewModel {
    public func navigate(to route: InventoryRoute?) {
        switch route {
        case let .add(item, .none):
            self.route = .add(.init(item: item))

        case let .add(item, .colorPicker):
            self.route = .add(.init(item: item, route: .colorPicker))

        case let .row(id, rowRoute):
            guard let viewModel = self.inventory[id: id]
            else { break }
            viewModel.navigate(to: rowRoute)

        case .none:
            self.route = nil
        }
    }
}

extension ItemRowViewModel {
    func navigate(to route: InventoryRoute.RowRoute) {
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
