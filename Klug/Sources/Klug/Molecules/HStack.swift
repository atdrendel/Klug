import SwiftUI


public extension HStack where Content == Klug.AccessoryView {
     init(
        _ image: Image,
        _ textfield: TextField<Text>,
        _ accessoryView: Klug.AccessoryViewType = .none
    ) {
        self.init(alignment: .center, spacing: 10) {
            image
            textfield
            accessoryView
          
        }
    }
}
