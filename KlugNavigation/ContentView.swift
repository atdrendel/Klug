//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
          Text("One")
          Text("Two")
          Text("Three")
        }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
