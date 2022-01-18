//: A UIKit based Playground for presenting user interface

import PlaygroundSupport
import Relative
import SwiftUI
import UIKit

// class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//
//
//        view.addSubview(shape)
//        self.view = view
//    }
// }
// Present the view controller in the Live View window
// PlaygroundPage.current.liveView = MyViewController()
func render<V: Relative>(view: V) -> Data {
    let size = CGSize(width: 600, height: 400)
    return CGContext.pdf(size: size) { context in
        view._render(context: context, size: size)
    }
}

struct MainView: View {
    private let shape = RelativeShapeView(shape: RelativeRectangle())
    var body: some View {
        Image(uiImage: UIImage(data: render(view: shape))!)
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

PlaygroundPage.current.setLiveView(MainView())
