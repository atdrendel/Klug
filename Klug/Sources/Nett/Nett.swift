import UIKit

public struct Nett<View>{
    public let render: (UIView) -> View
}

extension Nett where View == UIButton {
    public static let button = Self { view in
        let b = UIButton()
        b.setTitle("some button", for: .normal)
        b.configuration = .bordered()
        return b
    }
}

/*The idea is to compose views in a declarative way using UIKit
 Use Autolayout behind the seens to compose elements as
 they get added to the view tree
 
 Always return a Nett<A> for further drill downs
 
 TODOS
 1. contract a typical UIKit view
 2. try and convert it into a projected solution
 
 
 Nett<UIButton>
 Nett<UIView>
 Nett<UILabel>
 
 Render(
 Nett.render(
  .label("some text"),
  .button("label", style:, action),
  .button(&customButton)
  )
 )
 
 Nett {
   stack(.horizantal) {
    button()
     label()
   }
 }
 
 Render {
 Nett.render(
  .label("some text"),
  .button("label", style:, action),
  .button(&customButton)
  )
 }
 
 Nett.render(
  .stack(
     .horizontal,
     .render(
     .label("some text")
       .button(button, action: {
 
 })
     )
   )
 )
 
 */


