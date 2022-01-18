//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 02/09/2021.
//
import UIKit

public extension UIView {
    
    func border(color: UIColor, width:CGFloat = 1, cornerRadius: CGFloat = 10) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = cornerRadius
    }
    
    static func border(on stackView: UIStackView) -> UIView {
        .init {
            $0.border(color: .lightGray.withAlphaComponent(0.6))
            $0.addSubview(stackView)
            stackView.layout(using: [
                stackView.y(in: $0),
            ])
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            $0.layout(using: [
                $0.x(in: stackView),
                $0.width(in: stackView, ratio: 1),
                $0.height(50)
                
            ])
            
        }
    }
}

public extension UIView {
    
    static func spacer(_ spacer: Spacer = .mini) -> UIView {
        .init {
            $0.backgroundColor = .clear
            $0.layout(using: [
                $0.height(spacer.size())
            ])
        }
    }
    
    enum Spacer {
        case mini
        case small
        case medium
        case large
        case custom(_ value: CGFloat)

        func size() -> CGFloat {
            switch self {
            case .mini:
                return 4
            case .small:
                return 8
            case .medium:
                return 16
            case .large:
                return 32
            case let .custom(value):
                return value
            }
        }
    }
    
    func separator() {
        _ = UIView {
            $0.backgroundColor = .lightGray.withAlphaComponent(0.4)
            addSubview($0)
            $0.layout(using: [
                $0.width(in: self, ratio: 1),
                $0.height(1),
                $0.position(.top, in: self, 12),
                $0.x(in: self)
            ])
        }
    }
    
    static func separator(_ layoutPosition: LayoutPosition = .bottom, in view: UIView) -> UIView {
        _ = UIView {
            
            $0.backgroundColor = .lightGray.withAlphaComponent(0.4)
            view.addSubview($0)
            
            switch layoutPosition {
                
            case .leading, .trailing:
                $0.layout(using: [
                    $0.height(in: view, ratio: 1),
                    $0.width(1),
                    layoutPosition == .leading ? $0.leading(in: view, -10) : $0.trailing(in: view, 10)
                ])
                
            case .top, .bottom:
                $0.layout(using: [
                    $0.width(in: view, ratio: 1),
                    $0.height(1),
                    layoutPosition == .bottom ? $0.position(.top, in: view, 12) : $0.top(in: view, -10),
                    $0.x(in: view)
                ])
            }
          
        }
        return view
    }
}
