import UIKit

//public struct Nett {
//    @resultBuilder struct Builder {
//        static func buildBlock(_ views: UIView...) -> [UIView] { views }
//    }
//}
//
//protocol Nett {
//    associatedtype Render: Nett
//    var render: Render { get }
//}

/*The idea is to compose views in a declarative way using UIKit
 Use Autolayout behind the seens to compose elements as
 they get added to the view tree
 
 Always return a Nett<A> for further drill downs
 
 TODOS
 1. contract a typical UIKit view
 2. try and convert it into a projected solution
 

 
 Nett {
   stack(.horizantal) {
    button(action:{
 
 }, label: {
 
 })
    label()
 
   }
 }
 
 
 
 */


