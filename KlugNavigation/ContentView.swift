//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    
    var body: some View {
        var body: some View {
            TabView(selection: self.$selection) {
                Text("One")
                    .tabItem { Text("One") }
                    .tag(1)
                
                Text("Two")
                    .tabItem { Text("Two") }
                    .tag(2)
                
                Text("Three")
                    .tabItem { Text("Three") }
                    .tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
