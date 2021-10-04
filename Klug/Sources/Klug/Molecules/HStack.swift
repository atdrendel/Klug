import SwiftUI
import Relative

public extension HStack where Content == Klug.AccessoryView {
    init(
        _ image: Image,
        _ isSecureText: Bool,
        _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?),
        _ accessoryView: Klug.AccessoryViewType = .none
    ) {
        typealias _conditionalText = _ConditionalContent<SecureField<Text>, TextField<Text>>
        func _textfield() ->  _conditionalText {
            let textField = TextField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
            let secureTextField = SecureField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
            
            let trueContent: _conditionalText =
            ViewBuilder.buildEither(first: secureTextField)
            
            let falseContent: _conditionalText =
            ViewBuilder.buildEither(second: textField)
            let _text: _conditionalText =
            isSecureText ? trueContent : falseContent
            return _text
        }
        self.init(alignment: .center, spacing: 10) {
            image
            _textfield()
            accessoryView
        }
    }
}
