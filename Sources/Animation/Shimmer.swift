//
//  Shimmer.swift
//  Shimmer
//
//  Created by Evans Domina Attafuah on 28/07/2021.
//

import SwiftUI

struct Shimmer: View {
    
    @State var shimmer: Bool = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .foregroundStyle(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: shimmer ? .leading: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, endPoint: shimmer ? /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/ : .leading))
            .task {
                withAnimation(
                    .linear(duration: 1.5)
                    .repeatForever(autoreverses: true)
                        
                ) {
                    shimmer.toggle()
                }
            }
    }
}

struct Shimmer_Previews: PreviewProvider {
    static var previews: some View {
        Shimmer()
    }
}
