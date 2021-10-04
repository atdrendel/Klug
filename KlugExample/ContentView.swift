//
//  ContentView.swift
//  Example
//
//  Created by Evans Domina Attafuah on 04/09/2021.
//

import SwiftUI
import Klug
import Relative

enum CustomViewSelect {
    case rectangle
    case circle
    case image
    case text
}

extension String {
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
    var customViewSelect: CustomViewSelect
    
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
                
                HStack(.init(systemName: "lock"), $isSecureText, (titleKey: "some text", text: .constant(.empty), prompt: nil), .password({isSecureText = $0} ))
                //   .debug()
                   .border(.all, .linearGradient(.init(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom))
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 20, height: 20, alignment: .center)
                    
                    
                    Group {
                        if isSecureText {
                            TextField("some text", text: .constant(.empty)) } else {
                    SecureField("some text", text: .constant(.empty))
                            }
                    }
                    
                    Group {
                        switch customViewSelect {
                        case .rectangle :
                            Rectangle()
                        case .circle :
                            Circle()
                        case .image :
                            Image(systemName: "lock")
                        case .text :
                            Text("*")
                            
                        }
                    }
                    .debug()
                        
                    
                    AnyView(Circle()
                                .frame(width: 20))
                }
                .debug()
                .border(.all,.gray)
                
                
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

