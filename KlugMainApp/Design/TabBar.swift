import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems: [TabItem] = [
    .init(text: "Learn Now", icon: "house", tab: .home),
    .init(text: "Explore", icon: "magnifyingglass", tab: .explore),
    .init(text: "Notifications", icon: "bell", tab: .notifications),
    .init(text: "Library", icon: "rectangle.stack", tab: .library)
]

enum Tab: String {
    case home, explore, notifications, library
}

struct TabBar: View {
    @State var selectedTab = Tab.home
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    AccountView()
                case .explore:
                    DesignContentView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }

            AccountView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack {
                Spacer()
                ForEach(tabItems) { item in
                    Button {
                        selectedTab = item.tab
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(
                        selectedTab == item.tab ?
                            .secondary :
                            .primary
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                HStack {
                    Circle().fill(.pink).frame(width: 80)
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 8)
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
