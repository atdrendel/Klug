//
//  SceneDelegate.swift
//  Buttons
//
//  Created by Evans Domina Attafuah on 02/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ButtonsViewController()
        window.makeKeyAndVisible()
        self.window = window
        
    }
    
}

