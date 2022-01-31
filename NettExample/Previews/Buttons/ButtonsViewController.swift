//
//  ViewController.swift
//  Buttons
//
//  Created by Evans Domina Attafuah on 02/09/2021.
//

import UIKit

import Relative
import Nett

class ButtonsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let btn = UIButton(.apple, title: "Sign In")
        view.addSubview(btn)
        btn.layout(using:
                    [
                        btn.width(200),
                        btn.height(50),
                        btn.x(in: view),
                        btn.y(in: view)
                    ]
        )
    }
}

#if DEBUG
import SwiftUI
struct ButtonsViewControllerPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        ButtonsViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ButtonsViewControllerPreview()
    }
}
#endif



