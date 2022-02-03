import UIKit

public class Label {
    public var title: String = "Any Text"
    public var image: UIImage = .init(systemName: "bell")!
    
    public init(
        title: String = "Any Text",
        image: UIImage = .init(systemName: "bell")!
    ) {
        self.title = title
        self.image = image
    }
}

public class AnyViewController: UIViewController {
    public init(
        label: Label
    ) {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = label.title
        tabBarItem.image = label.image
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class NettTabbar: UITabBarController {
    let viewController: [UIViewController]
    
    public init(viewControllers: [AnyViewController]) {
        self.viewController = viewControllers
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
