//
//  ParticleSystem.swift
//  ParticleSystem
//
//  Created by Evans Domina Attafuah on 12/08/2021.
//

import SwiftUI

struct ParticleSystem: View {
    
    @State private var acceleration = 5
    
    var body: some View {
        ZStack {
           
            ForEach(0..<12) { item in
                VStack(spacing: 100) {
                    Capsule()
                        .frame(width: 3, height: 6)
                        .foregroundColor(.cyan)
                        .hueRotation(.degrees(.init(item) * .pi * 2.0))
                        .blendMode(.exclusion)
                        .offset(y: .init(acceleration))
                        .rotationEffect(.degrees(.init(item) * 30), anchor: .bottom)
                        .task {
                            withAnimation(.easeIn(duration: 2).repeatForever(autoreverses: false)) {
                                acceleration = 300
                            }
                        }
                    
                    Capsule()
                        .frame(width: 3, height: 6)
                        .foregroundColor(.cyan)
                        .hueRotation(.degrees(.init(item) * 30))
                        .blendMode(.exclusion)
                        .offset(y: .init(acceleration))
                        .rotationEffect(.degrees(.init(item) * 30), anchor: .bottom)
                        .task {
                            withAnimation(.easeIn(duration: 3).repeatForever(autoreverses: false)) {
                                acceleration = 300
                            }
                        }
                    
                    Capsule()
                        .frame(width: 3, height: 6)
                        .foregroundColor(.cyan)
                        .hueRotation(.degrees(.init(item) * 30))
                        .blendMode(.exclusion)
                        .offset(y: .init(acceleration))
                        .rotationEffect(.degrees(.init(item) * 30), anchor: .bottom)
                        .task {
                            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                                acceleration = 300
                            }
                        }
                    
                    Capsule()
                        .frame(width: 3, height: 6)
                        .foregroundColor(.cyan)
                        .hueRotation(.degrees(.init(item) * 30))
                        .blendMode(.exclusion)
                        .offset(y: .init(acceleration))
                        .rotationEffect(.degrees(.init(item) * 30), anchor: .bottom)
                        .task {
                            withAnimation(.easeInOut(duration: 6).repeatForever(autoreverses: false)) {
                                acceleration = 300
                            }
                        }
             
                }
                
            }
            
        }
    }
}

struct ParticleSystem_Previews: PreviewProvider {
    static var previews: some View {
        ParticleSystem()
    }
}
