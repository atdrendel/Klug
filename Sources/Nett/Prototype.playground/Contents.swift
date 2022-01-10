import UIKit
import PlaygroundSupport
import Nett

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Helloo World"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        print("hi")
        Nett.button.render(UIButton())
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
