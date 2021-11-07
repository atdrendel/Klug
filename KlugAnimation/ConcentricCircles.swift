//
//  ConcentricCircles.swift
//  ConcentricCircles
//
//  Created by Evans Domina Attafuah on 13/08/2021.
//

import SwiftUI

struct ConcentricCircles: View {
    
    @State  private var move = 300
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                ForEach(0..<12) { circle in
                    Circle()
                        .stroke(lineWidth: 5)
                        .frame(width: .init(20 * circle), height: .init(20 * circle))
                        .foregroundColor([.pink, .mint, .green, .yellow].randomElement()!)
                        .offset(y: .init(move))
                        .animation(
                            .easeInOut(duration: 1.8)
                                .repeatForever(autoreverses: true)
                                .delay(.init(0.1) * .init(circle))
                            ,value: move)
                }
                
            }
            .rotation3DEffect(.degrees(25), axis: (x: -5, y: -5, z: 5))
            .task {
                move = -300
            }
            
        }
    }
}

struct ConcentricCircles_Previews: PreviewProvider {
    static var previews: some View {
        ConcentricCircles()
            .preferredColorScheme(.dark)
    }
}
