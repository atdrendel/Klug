//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 01/09/2021.
//
import UIKit
import SwiftUI

public enum NettView {
    case logo
    case button(top: UIView, constant: CGFloat = 32)
}

public extension Image {
    static let apple = Image("Social/apple",bundle: .module)
    static let google = Image("Social/google",bundle: .module)
}

public extension String {
    static let next = "Next"
    static let signup = "Sign up"
    static let signin = "Sign in"
    static let apple = "Apple"
    static let google = "Google"

}
