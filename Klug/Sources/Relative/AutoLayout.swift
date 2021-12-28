//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 01/09/2021.
//

import UIKit

// MARK: Layout
public enum LayoutPosition {
    case leading
    case trailing
    case top
    case bottom
}

public enum LayoutSize {
    case width(_ value: CGFloat)
    case height(_ value: CGFloat)
}

public extension UIView {
    
    func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func layout(in parent: UIView) {
        layout(using: [
            x(in: parent),
            width(in: parent),
            top(in: parent),
            bottom(in: parent)
        ])
    }
}

public extension UIView {
    
    func fitted(in view: UIView, edgeInsets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInsets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInsets.bottom),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edgeInsets.right),
        ])
    }
    
    func x(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
    }
    
    func y(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
    }
    
#warning("update API to use position")
    func leading(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
    }
    
    func trailing(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
    }
    
    func top(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
    }
    
    func bottom(in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
    }
    
#warning("update API to use associate values in place on 3 parameters")
    func position(_ layoutPosition: LayoutPosition, in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        switch layoutPosition {
        case .leading:
            return leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
        case .trailing:
            return trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        case .top:
            return topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        case .bottom:
            return bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        }
    }
    
    func safeArea(_ layoutPosition: LayoutPosition, in view: UIView, _ constant: CGFloat = 0) -> NSLayoutConstraint {
        switch layoutPosition {
        case .leading:
            return leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant)
        case .trailing:
            return trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant)
        case .top:
            return topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
        case .bottom:
            return bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant)
        }
    }
    
    func width(_ w: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalToConstant: w)
    }
    
    func halve(_ layoutSize: LayoutSize) -> CGFloat {
        switch layoutSize {
        case .width(let v):
            return frame.size.width * v
        case .height(let v):
            return frame.size.height * v
        }
    }
    
    func width(in view: UIView, ratio: CGFloat = 1) -> NSLayoutConstraint {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio)
    }
    
    func height(_ h: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalToConstant: h)
    }
    
    func height(in view: UIView, ratio: CGFloat = 1) -> NSLayoutConstraint {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio)
    }
    
}
