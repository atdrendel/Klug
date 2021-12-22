//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Evans Domina Attafuah on 26/06/2021.
//

import SwiftUI

struct FirstAnimation: View {
    
    @State var opacity = false
    
    var body: some View {
        Text("SwiftUI Animation")
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .opacity(opacity ? 1 : 0)
            .scaleEffect(opacity ? 1 : 0)
            .task {
                withAnimation(.spring().repeatForever(autoreverses: true)) {
                    opacity.toggle()
                }
               
            }
            .padding()
    }
}

struct FirstAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FirstAnimation()
    }
}
