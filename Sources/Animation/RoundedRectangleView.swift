//  RoundedRectangle.swift
//  RoundedRectangle
//  Created by Evans Domina Attafuah on 12/08/2021.
//

// using explicit animation
// changing to iOS 15 in settings
// using .init in place of CGFloat or Double
// remove Animation in place of .linear or .easeInOut etc
import SwiftUI

struct RoundedRectangleView: View {
    @State private var animateWidth = 200
    @State private var imageSize = 30
    @State private var imageRotation = 0
    @State private var scaleX = false
    @State private var scaleY = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 48)
                    .fill(.mint)
                    .frame(width: .init(animateWidth), height: 48, alignment: .center)
                    //    .shadow(radius: 5)
                    .onTapGesture {
                        withAnimation(.timingCurve(0.68, -0.6, 0.32, 1.6)) {
                            animateWidth = animateWidth == 70 ? 200 : 70
                        }
                        
                        withAnimation(.timingCurve(0.785, 0.135, 0.150, 0.860)) {
                            imageRotation = imageRotation == 360 ? 0 : 360
                            imageSize = imageSize == 30 ? 15 : 30
                        }
                    }
                
                Image(systemName: "circle.grid.cross.fill")
                    .resizable()
                    .rotationEffect(.degrees(.init(imageRotation)))
                    .frame(width: .init(imageSize), height: .init(imageSize))
                    .foregroundColor(.white)
            }
            
            RoundedRectangle(cornerRadius: 48)
                .frame(width: 200, height: 48, alignment: .center)
                .foregroundColor(.pink)
                .scaleEffect(x: scaleX ? 1 : 0.5)
                .scaleEffect(y: scaleY ? 1 : 0.5)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 2, dampingFraction: 0.4)) {
                        scaleX.toggle()
                    }
                    
                    withAnimation(.interactiveSpring(response: 4, dampingFraction: 0.4)) {
                        scaleY.toggle()
                    }
                }
        }
    }
}

struct RoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
    }
}
