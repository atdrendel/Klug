import SwiftUI


public extension HStack where Content == Klug.AccessoryView {
     init(
        image: Image,
        textfield: TextField<Text>,
        accessoryView: Klug.AccessoryViewType
    ) {
        self.init(alignment: .center, spacing: 10) {
            image
            textfield
            accessoryView
          
        }
    }
}
