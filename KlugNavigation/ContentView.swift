//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

class AppViewModel: ObservableObject {
  @Published var selectedTab: Int

  init(selectedTab: Int = 1) {
    self.selectedTab = selectedTab
  }
}

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
        var body: some View {
            TabView(selection: $viewModel.selectedTab) {
                
                VStack {
                  Text("One")
                  Button("Go to 2nd tab") { self.viewModel.selectedTab = 2 }
                }
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
        ContentView(selection: .init())
    }
}
