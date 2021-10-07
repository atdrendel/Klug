//
//  KlugNavigationApp.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 06/10/2021.
//

import SwiftUI

@main
struct KlugNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(selectedTab: .inventory))
        }
    }
}
