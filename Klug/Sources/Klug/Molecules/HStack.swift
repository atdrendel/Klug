import SwiftUI

public extension HStack where Content == Klug.AccessoryView {
    init<MainView: View>(icon: Image, mainView: MainView, acccessoryView: Klug.AccessoryViewType) {
        self.init(alignment: .center, spacing: 10) {
            icon
            mainView.font(.largeTitle)
            acccessoryView
        }
    }
}

