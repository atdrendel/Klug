import Parsing
import SwiftUI

struct DeepLinkRequest {
    var pathComponents: ArraySlice<Substring>
    var queryItems: [String: ArraySlice<Substring?>]
}

extension DeepLinkRequest {
    init(url: URL) {
        let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems ?? []
        self.init(
            pathComponents: url.path.split(separator: "/")[...],
            queryItems: queryItems.reduce(into: [:]) { dictionary, item in
                dictionary[item.name, default: []].append(item.value?[...])
            }
        )
    }
}

struct PathComponent: Parser {
    let component: String

    init(_ component: String) {
        self.component = component
    }

    func parse(_ input: inout DeepLinkRequest) -> Void? {
        guard input.pathComponents.first == self.component[...]
        else { return nil }
        input.pathComponents.removeFirst()
        return ()
    }
}

enum AppRoute {
    case one
    case inventory(InventoryRoute?)
    case three
}

enum InventoryRoute {
    case add
}

let deepLinker = PathComponent("one").map { AppRoute.one }
    .orElse(PathComponent("inventory").map { .inventory(.none) })
    .orElse(PathComponent("inventory")
        .skip(PathComponent("add"))
        .map { .inventory(.add) }
    )
    .orElse(PathComponent("three").map { .three })

enum Tab {
    case one, inventory, three
}

class AppViewModel: ObservableObject {
    @Published var inventoryViewModel: InventoryViewModel
    @Published var selectedTab: Tab

    init(
        inventoryViewModel: InventoryViewModel = .init(),
        selectedTab: Tab = .one
    ) {
        self.inventoryViewModel = inventoryViewModel
        self.selectedTab = selectedTab
    }

    func open(url: URL) {
        var request = DeepLinkRequest(url: url)
        if let route = deepLinker.parse(&request) {
            switch route {
            case .one:
                self.selectedTab = .one

            case let .inventory(inventoryRoute):
                self.selectedTab = .inventory
                self.inventoryViewModel.navigate(to: inventoryRoute)

                switch inventoryRoute {
                case .add:
                    self.inventoryViewModel.route = .add(
                        .init(
                            item: .init(name: "", color: nil, status: .inStock(quantity: 1))
                        )
                    )

                case .none:
                    self.inventoryViewModel.route = nil
                }

            case .three:
                self.selectedTab = .three
            }
        }
    }
}

extension InventoryViewModel {
    func navigate(to route: InventoryRoute?) {
        switch route {
        case .add:
            self.route = .add(
                .init(item: .init(name: "", color: nil, status: .inStock(quantity: 1)))
            )
        case .none:
            self.route = nil
        }
    }
}

struct NavigationContentView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        TabView(selection: self.$viewModel.selectedTab) {
            Button("Go to 2nd tab") {
                self.viewModel.selectedTab = .inventory
            }
            .tabItem { Text("One") }
            .tag(Tab.one)

            NavigationView {
                InventoryView(viewModel: self.viewModel.inventoryViewModel)
            }
            .tabItem { Text("Inventory") }
            .tag(Tab.inventory)

            Text("Three")
                .tabItem { Text("Three") }
                .tag(Tab.three)
        }
        .onOpenURL { url in
            self.viewModel.open(url: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContentView(viewModel: .init(selectedTab: .inventory))
    }
}
