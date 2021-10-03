import SwiftUI

public extension HStack where Content == Klug.IconView {
    init(icon: Image, mainView: TextField<Text>, acccessoryView: Klug.AccessoryViewType) {
        self.init(alignment: .center, spacing: 10) {
            icon
            mainView
            acccessoryView
        }
    }
}

