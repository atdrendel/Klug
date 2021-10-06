//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var body: some View {
            TabView {
              Text("One")
                .tabItem { Text("One") }

              Text("Two")
                .tabItem { Text("Two") }

              Text("Three")
                .tabItem { Text("Three") }
            }
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
