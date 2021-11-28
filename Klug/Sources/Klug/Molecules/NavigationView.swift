import SwiftUI

public extension NavigationView {
    init(_ titleColor: UIColor, content: () -> Content) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: titleColor]
        self.init(content: content)
    }
}
