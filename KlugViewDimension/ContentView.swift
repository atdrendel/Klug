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
            
//            MeasureBehavior(
//                Rectangle()
//                    .rotation(.degrees(45))
//                    .fill(Color.red)
//                    .clipped()
//                    .frame(width: 100, height: 100)
//            )
//
//            MeasureBehavior(
//                Rectangle()
//                    .rotation(.degrees(45))
//                    .fill(Color.red)
//                    .mask(Circle())
//            )
//
//            MeasureBehavior(
//                Rectangle()
//                    .fill(Color.red)
//                    .mask(Capsule())
//            )
            
//            MeasureBehavior(
//                HStack {
//                    Text("Hello, World, World")
//                        .layoutPriority(1)
//                        .lineLimit(1)
//                        .truncationMode(.middle)
//                    Rectangle().fill(.blue).frame(minWidth: 50)
//                }
//
//            )
            
            MeasureBehavior(
                HStack(spacing: 0) {
                Text("some text some text some text some text some text").truncationMode(.middle).lineLimit(1)
                Text("chapter1.md").layoutPriority(1)
                }
            )
            
 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
