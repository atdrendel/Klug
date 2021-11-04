import SwiftUI
import Klug
import Relative

public extension String {
    enum Account: String {
        case email = "bell.fill"
        case password = "key.fill"
    }
    init(_ account: Account) {
        self.init(account.rawValue)
    }
}

struct ContentView: View {
    
    @State private var isSecureText = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                Rectangle()
                    .fill(.gray)
                    .overlay(
                        Image(systemName: "airtag.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .opacity(0.4)
                    )
                    .opacity(0.4)
                    .frame(width:300, height: 300, alignment: .center)
                
                Text("Login")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                    .padding(.top, 16)
                
                HStack(.init(systemName: .init(.email)),
                       $isSecureText, (titleKey: "Password", text: .constant(.empty), prompt: nil), .none)
                    .border(.all, .gray)
                
                HStack(
                    .init(systemName: .init(.password)),
                    $isSecureText,
                    (titleKey: "Password", text: .constant(.empty), prompt: nil),
                    .password({isSecureText = $0}))
                    .border(.all, .linearGradient(.init(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom))
            
                HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil),
                       .rectangle(.blue))
                    .border(.all, .pink)
                
                HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil),
                       .circle(.green))
                    .border(.all, .pink)
                
                HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(""), prompt: nil),
                       .init(systemName: "swift"))
                    .border(.all, .pink)
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

