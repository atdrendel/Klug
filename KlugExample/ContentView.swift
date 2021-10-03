//
//  ContentView.swift
//  Example
//
//  Created by Evans Domina Attafuah on 04/09/2021.
//

import SwiftUI
import Klug
import Relative

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
                
<<<<<<< HEAD
                
//                Image(systemName: "lock")
//                TextField("", text: .constant("typed text"))
//
//                accessoryView(.custom(AnyView(Circle())))
                
//                    accessoryView(.password({
//                        print($0)
//                    }))
                HStack(icon: Image(systemName: "lock"), mainView:  TextField("", text: .constant("typed text")), acccessoryView: .custom(AnyView(Circle())))
=======
                HStack(type: .stack) {
                    Image(systemName: "lock")
                    TextField("", text: .constant("typed text"))
                    
                    accessoryView(.custom(Text("d")))
                    
//                    accessoryView(.password({
//                        print($0)
//                    }))
                }
>>>>>>> parent of 3833b19 (still experimenting with Single custom view)
                .debug()
                    .border(.all, .linearGradient(.init(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom))
                    

            
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


