import Foundation
import UIKit

public final class AttributedText {
    
    private var attribute: NSMutableAttributedString
    private var range: NSRange
    
    public init(text: String, textHighlight: String) {
        self.attribute = NSMutableAttributedString(string: text)
        self.range = (text as NSString).range(of: textHighlight)
    }
    
    public func range(text: String, textHighlight: String) -> Self {
        range = (text as NSString).range(of: textHighlight)
        return self
    }
    
    public func font(font: UIFont) -> Self {
        attribute.addAttribute(.font, value: font , range: range)
        return self
    }
    
    public func change(color: UIColor, build: Bool = true) -> Self {
        self.attribute.addAttribute(.foregroundColor, value: color , range: range)
        return self
    }
    
    public func build() -> NSMutableAttributedString {
        return attribute
    }
}


