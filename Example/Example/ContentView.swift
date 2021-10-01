//
//  ContentView.swift
//  Example
//
//  Created by Evans Domina Attafuah on 04/09/2021.
//

import SwiftUI
import Klug

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
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .overlay(Image(systemName: "airtag.fill")
                                    .foregroundColor(.gray)
                                    .opacity(0.4))
                        .opacity(0.4)
                    .frame(width: 100, height: 100)
                    
                    
//                        .resizable()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}
