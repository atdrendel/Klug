//
//  ViewController.swift
//  NettExample
//
//  Created by Evans Domina Attafuah on 02/09/2021.
//

import UIKit
import Relative

class ViewController: UIViewController {
    
    public override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    
}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview().ignoresSafeArea()
    }
}
#endif

