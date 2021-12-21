import SwiftUI
import ParsingHelpers
import ItemRowFeature

@main
struct ItemRowPreviewAppApp: App {
    let viewModel  = ItemRowViewModel(item: .init(name: "Airpods", color: .red, status: .inStock(quantity: 10)))
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    ItemRowView(
                        viewModel: self.viewModel
                    )
                }
            }
            .onOpenURL { url in
                var request = DeepLinkRequest(url: url)
                if let route = itemRowDeepLinker.parse(&request) {
                    self.viewModel.navigate(to: route)
                }
            }
        }
    }
}
