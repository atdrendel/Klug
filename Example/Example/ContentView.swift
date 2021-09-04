//
//  ContentView.swift
//  Example
//
//  Created by Evans Domina Attafuah on 04/09/2021.
//

import SwiftUI
import Klug

struct ContentView: View {
    var body: some View {
        VStack {
            Button(icon: .google, title: .google) {
                
            }
            .buttonStyle(.social(.google))
            
            Button(icon: .apple, title: .apple) {
                print("chicken")
                
            }
            .buttonStyle(.social(.apple))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}
