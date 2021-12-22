//
//  Rotation.swift
//  Rotation
//
//  Created by Evans Domina Attafuah on 28/07/2021.
//

import SwiftUI

class Animations: ObservableObject {
    @Published var rotation = 0.0
    @Published var scaleXY = 1.0
    
    // initial
    @Published var positionX = -150
    @Published var color: Color = .purple
    @Published var opacity = 0.2
    @Published var cornerRadius = 1
}

struct Rotation: View {
    @ObservedObject var animations: Animations
    
    var body: some View {
        RoundedRectangle(cornerRadius: .init(animations.cornerRadius))
            .fill(animations.color)
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(animations.rotation))
            .scaleEffect(animations.scaleXY)
            .offset(x: .init(animations.positionX))
            .opacity(animations.opacity)
            .task {
                withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4)) {
                    animations.rotation += 360
                    animations.scaleXY += 1.1
                    animations.positionX = 150
                    animations.color = .pink
                    animations.opacity = 1
                    animations.cornerRadius = 15
                    
                }
            }
    }
}

struct Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Rotation(animations: .init())
            .edgesIgnoringSafeArea(.all)
    }
}
