
import UIKit
import Nett
import Relative

// # 1 Contact
public struct Contact: Equatable, Hashable {
    let id = UUID().uuidString
    var name: String
    var isSelected = false
}

// # 2 Cell
public class Cell: UITableViewCell {
    static var reuseIdentifier: String = "Cell"
    
    let _name = UILabel()
    let _imageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        _name.font = UIFont.preferredFont(forTextStyle: .headline)
        _name.textColor = .systemTeal
   
        _imageView.backgroundColor = .clear
        
        contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = UIColor.systemTeal.cgColor
        contentView.layer.cornerRadius = 14
        
        _imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let vstack = UIStackView(arrangedSubviews: [_imageView, _name])
        vstack.axis = .horizontal
        vstack.spacing = 16

        _imageView.contentMode = .scaleAspectFit
        _imageView.sizeToFit()

        contentView.layoutMargins = .init(top: 20, left: 0, bottom: 10, right: 0)
        contentView.addSubview(vstack)
        vstack.layout(using: [
            vstack.leading(in: contentView, 16),
            vstack.trailing(in: contentView),
            vstack.height(50),
            vstack.x(in: self)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with contact: Contact) {
        _name.text = contact.name
        _imageView.image = .init(systemName: contact.isSelected ? "eye.fill" : "")
    }
    
}

#if DEBUG
import SwiftUI
struct CellPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let cell = Cell()
        cell.configure(with: .init(name: "Evans Codebendr", isSelected: true))
        return cell
    }
    
    func updateUIView(_ view: UIView, context: Context) {}
}

@available(iOS 13.0, *)
struct Cell_Preview: PreviewProvider {
    static var previews: some View {
        CellPreview()
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
#endif
