//
//  ContentView.swift
//  KlugViewDimension
//
//  Created by Evans Domina Attafuah on 13/10/2021.
//

import SwiftUI
import Klug

struct ContentView: View {
    var body: some View {
        VStack {
            
            MeasureBehavior(
                Rectangle()
                    .rotation(.degrees(45))
                    .fill(Color.red)
                    .clipped()
                    .frame(width: 100, height: 100)
            )
 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
