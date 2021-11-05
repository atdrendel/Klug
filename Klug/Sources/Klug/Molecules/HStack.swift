import SwiftUI

public extension Klug {

    static func _textfield(_ isSecureText: Binding<Bool>, _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?)) ->  Klug.AccessoryConditionalContent {
    let textField = TextField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
    let secureTextField = SecureField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
    
    return isSecureText.wrappedValue ?
    ViewBuilder.buildEither(first: secureTextField) :
    ViewBuilder.buildEither(second: textField)
}
}

extension Klug {
public struct _TextField {
    func _textfield(_ isSecureText: Binding<Bool>, _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?)) ->  Klug.AccessoryConditionalContent {
        let textField = TextField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
        let secureTextField = SecureField(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
        return isSecureText.wrappedValue ?
        ViewBuilder.buildEither(first: secureTextField) :
        ViewBuilder.buildEither(second: textField)
    }
}
}
public extension HStack where Content == Klug.AccessoryView {
    init(
        _ image: Image,
        _ isSecureText: Binding<Bool>,
        _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?),
        _ accessoryView: Klug.AccessoryViewType = .none
    ) {
        self.init(alignment: .center, spacing: 10) {
            image.modifier(Klug.TextFieldImageModifier())
            Klug._textfield(isSecureText, textfield)
            accessoryView
        }
    }
}

public extension HStack where Content == Klug.AccessoryViewImage {
    init(
        _ image: Image,
        _ isSecureText: Binding<Bool>,
        _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?),
        _ imageAccessory: Image
    ) {
        self.init(alignment: .center, spacing: 10) {
            image.modifier(Klug.TextFieldImageModifier())
            _textfield(isSecureText, textfield)
            imageAccessory
        }
    }
}

struct HStack_Preview: PreviewProvider {
    @State static var isSecureText = true
    static var previews: some View {
        
        VStack {
   
            HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil), .password({isSecureText = $0}))
                .border(.all, .linearGradient(.init(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom))

            HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil),
                   .rectangle(Color.blue))
                .border(.all, .pink)
            
            HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil),
                   .init(systemName: "swift"))
                .border(.all, .pink)
        }
        .padding()
    
    }
}
