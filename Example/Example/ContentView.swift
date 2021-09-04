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
            Button(social: .apple, title: .apple) {
                
            }
            .buttonStyle(.social(.apple))
            
            Button(social: .google, title: .google) {
                
            }
            .buttonStyle(.social(.google))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}
