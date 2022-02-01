//
//  ContentView.swift
//  NettCompositionalLayout
//
//  Created by Evans Domina Attafuah on 01/02/2022.
//

import SwiftUI
import UIKit

public struct Label {
    public var title: String = "Any Text"
    public var image: UIImage = .init(systemName: "bell")!
}

public protocol L {
    var label: Label { get set }
}

public class AnyViewController: UIViewController, L {
    public var label: Label
    
    init(
        label: Label
    ) {
        self.label = label
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = label.title
        tabBarItem.image = label.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//extension UIViewController {
//    convenience init(
//        label: Label
//    ) {
//        self.init()
//        tabBarItem.title = label.title
//        tabBarItem.image = label.image
//    }
//}

public class NettTabbar: UITabBarController {
    let viewController: [UIViewController]

    public init<V: UIViewController>(viewController: [V]) where V: L {
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers(viewController, animated: false)
    }

    override public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item)
        else { return }

//        switch index {
//        case 0:
//            self.viewModel.selectedTab = .one
//        case 1:
//            self.viewModel.selectedTab = .inventory
//        case 2:
//            self.viewModel.selectedTab = .three
//        default:
//            break
//        }
    }
}

#if DEBUG
import SwiftUI
struct NettTabbarPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = NettTabbar

    func makeUIViewController(context: Context) -> NettTabbar {
        .init(viewController: [
            AnyViewController(label: .init()),
        ])
    }

    func updateUIViewController(_ uiViewController: NettTabbar, context: Context) {}
}

@available(iOS 13.0, *)
struct NettTabbarPreview_Preview: PreviewProvider {
    static var previews: some View {
        NettTabbarPreview().ignoresSafeArea()
    }
}
#endif
