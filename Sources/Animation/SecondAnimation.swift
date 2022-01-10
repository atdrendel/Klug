//
//  SecondAnimation.swift
//  SwiftUIAnimation
//
//  Created by Evans Domina Attafuah on 26/06/2021.
//

import SwiftUI

struct BellAnimation: View {
    
    @State var rotating = false

    
    var body: some View {
        Group {
            Image(systemName: "bell.fill")
                .font(.system(size:124))
                .rotationEffect(.degrees(rotating ? -45 : 45), anchor: .top)
                
                .task {
               
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.3)) {
                        rotating.toggle()
                    }
            }
        }
    }
}

struct BellAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BellAnimation()
    }
}

public extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
