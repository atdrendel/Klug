//
//  ContentView.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

enum Tab {
  case one, two, three
}

class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab

    init(selectedTab: Tab = .one) {
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
                  Button("Go to 2nd tab") { self.viewModel.selectedTab = .two }
                }
                .tabItem { Text("One") }
                .tag(Tab.one)
                
                Text("Two")
                    .tabItem { Text("Two") }
                    .tag(Tab.two)
                
                Text("Three")
                    .tabItem { Text("Three") }
                    .tag(Tab.three)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selection: .init(selectedTab: .two))
    }
}
