//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Relative

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let shape = RelativeShapeView(shape: RelativeRectangle())
        
        view.addSubview(shape)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
