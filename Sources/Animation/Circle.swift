//
//  Circle.swift
//  Circle
//
//  Created by Evans Domina Attafuah on 11/08/2021.
//

import SwiftUI

struct CircleView: View {
    @State private var animateGreenCircle = false
    @State private var animateRedCircle = false
    @State private var animateBlueCircle = false
    @State private var phase: CGFloat = 0
    @State private var isOpacity = 0.2
    @State private var path = 0
    @State private var removeInnerFill = 50
    @State private var showCircle = 0
    @State private var rotation3D = 0
     
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: .init(removeInnerFill))
                .frame(width: 90, height: 90)
                .scaleEffect(.init(showCircle))
                .rotation3DEffect(.degrees(Double(rotation3D)), axis: (x: 15, y: 15, z: 0.0))
                .task {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        removeInnerFill = 0
                    }
                    
                    // .timingCurve(1.00, -0.600, 1.000, 1.635)
                    withAnimation(.easeInOut
                        .speed(0.2)
                        .delay(1.25)
                        .repeatForever(autoreverses: true)) {
                            showCircle = 1
                            rotation3D = 180
                        }
                }
            
            Circle()
                .trim(from: 0, to: .init(path))
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 120, height: 120)
                .task {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        path = 1
                    }
                }
 
            CircleItem(color: .green, size: 50)
                .scaleEffect(animateGreenCircle ? 1.2 : 1)
                .opacity(animateGreenCircle ? 0 : 1)
                .task {
                    withAnimation(
                        .easeInOut(duration: 4)
                            .delay(1)
                            .repeatForever(autoreverses: true)
                    ) {
                        animateGreenCircle.toggle()
                    }
                }
            
            CircleItem(color: .pink, size: 100)
                .scaleEffect(animateRedCircle ? 1.2 : 1)
                .opacity(animateRedCircle ? 0 : 1)
                .task {
                    withAnimation(
                        .easeInOut(duration: 4.5)
                            .delay(1)
                            .repeatForever(autoreverses: true)
                    ) {
                        animateRedCircle.toggle()
                    }
                }
            
            CircleItem(color: .cyan, size: 150)
                .scaleEffect(animateBlueCircle ? 1.2 : 1)
                .opacity(0.4)
                .task {
                    withAnimation(
                        .easeInOut(duration: 4.7)
                            .delay(1)
                            .repeatForever(autoreverses: true)
                    ) {
                        animateBlueCircle.toggle()
                    }
                }
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
                .frame(width: 200, height: 200)
                .opacity(isOpacity)
                .task {
                    withAnimation(.linear.repeatForever(autoreverses: false)) {
                        phase -= 20
                    }

                    withAnimation(
                        .linear(duration: 3)
                            .repeatForever()
                    ) {
                        isOpacity = 1
                    }
                }
        }
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleView()
            //   .environment(\.colorScheme, .dark)
        }
    }
}

struct CircleItem: View {
    let color: Color
    let size: CGFloat
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        Circle()
            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
            .frame(width: width - size, height: height - size, alignment: .center)
    }
}
