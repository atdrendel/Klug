//
//  ButtonsView.swift
//  ButtonsView
//
//  Created by Evans Domina Attafuah on 02/09/2021.
//

import UIKit
import SwiftUI

struct ButtonsPreview: UIViewRepresentable {
    
    let button: UIButton
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.addSubview(button)
        button.layout(using:
                        [
                            button.width(200),
                            button.height(50),
                            button.x(in: view),
                            button.y(in: view)
                        ]
        )
        return view
        
    }
    
    func updateUIView(_ view: UIView, context: Context) {}
}

@available(iOS 13.0, *)
struct Buttons_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            
            ButtonsPreview(button: .init(.apple, title: "Sign In"))
            
            
            ButtonsPreview(button: .init(.google, title: "Sign Up"))
        }
        .previewLayout(.canvas())
    }
}

