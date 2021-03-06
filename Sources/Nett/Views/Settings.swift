//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 01/09/2021.
//
import UIKit

public enum NettView {
    case logo
    case button(top: UIView, constant: CGFloat = 32)
}

public enum Social {
    case apple
    case google
}

public extension UIImage {
    static let apple = UIImage(named: "Social/apple", in: .module, with: .none)!
    static let google = UIImage(named: "Social/google", in: .module, with: .none)!
}

public extension String {
    static let next = "Next"
    static let signup = "Sign up"
    static let signin = "Sign in"
    static let apple = "Apple"
    static let google = "Google"
    
    enum Agreement: String {
        case agree = "I agree to the "
        case terms = "Terms of Conditions"
        case privacy = "Privacy Policy"
    }
    
    enum Account: String {
        case existingAccount = "Already have an account?"
        case resendCode = "Resend verification code"
    }
}
