//
//  SwiftUIAnimationApp.swift
//  SwiftUIAnimation
//
//  Created by Evans Domina Attafuah on 26/06/2021.
//

import SwiftUI
import Foundation

func delay(seconds: TimeInterval, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: block)
}

//@main
struct SwiftUIAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            CircleView()
        }
    }
}
