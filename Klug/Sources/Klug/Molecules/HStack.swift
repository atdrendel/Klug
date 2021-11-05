import SwiftUI

public extension Klug {
    
     struct _TextField: View {
         
        private var isSecureText: Binding<Bool>
        private var textField: TextField<Text>
        private var secureTextField: SecureField<Text>
         
        public init(_ isSecureText: Binding<Bool>, _ textfield: (titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?)) {
            self.isSecureText = isSecureText
            self.textField = .init(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
            self.secureTextField = .init(textfield.titleKey, text: textfield.text, prompt: textfield.prompt)
        }
        
        public var body: some View {
            isSecureText.wrappedValue ? ViewBuilder.buildEither(first: secureTextField) : ViewBuilder.buildEither(second: textField)
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
            Klug._TextField(isSecureText, textfield)
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
            Klug._TextField(isSecureText, textfield)
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
