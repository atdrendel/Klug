import UIKit
import Relative

// # 3 Main View
public class MainView: UIView {
    
    // # 5 UISearchBar
    public let searchView = UISearchBar()
    
    // # 6 true if user is typing in search 
    var isFiltering = false
    
    public let tableView = UITableView()

    public var isAllSelected = false
    public var button = UIButton {
        $0.setTitle("Select All", for: .normal)
        $0.titleLabel?.font = .preferredFont(forTextStyle: .body)
        $0.backgroundColor = .systemBlue
        $0.layout(using: [$0.height(50)])
        $0.layer.cornerRadius = 10
    }

    public func configure<T: Cell>(_ cellType: T.Type, with contact: Contact, for indexPath: IndexPath) -> T {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: contact)
        return cell
    }
    
    init() {
        super.init(frame: CGRect())
        addSubview(button)
        
        addSubview(searchView)
        
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
        addSubview(tableView)
        tableView.layout(using: [
            tableView.leading(in: self),
            tableView.trailing(in: self),
            tableView.bottom(in: self),
            tableView.position(.top, in: searchView, 15)
        ])
        
        button.layout(using: [
            button.width(in: self, ratio: 0.5),
            button.height(50),
            button.x(in: self),
            button.safeArea(.top, in: self)
        ])
        
        searchView.layout(using: [
            searchView.position(.top, in: button, 10),
            searchView.leading(in: self),
            searchView.trailing(in: self),
            searchView.height(40),
            searchView.x(in: self),
        ])
        
        style()
        
    }
    
    func style() {
        searchView.backgroundColor = UIColor.clear
        searchView.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchView.setImage(UIImage(), for: .search, state: .normal)
        searchView.tintColor = UIColor.clear
        searchView.isTranslucent = true
        searchView.searchTextField.leftViewMode = .always
        searchView.searchTextField.borderStyle = .roundedRect
        searchView.searchTextField.backgroundColor = .systemGray.withAlphaComponent(0.3)
        
//        if let searchView.searchTextField = value(forKey: "searchField") as? UITextField {
//            searchView.searchTextField.tintColor = .black
//            searchView.searchTextField.borderStyle = .none
//            searchView.searchTextField.font = UIFont.preferredFont(forTextStyle: .callout)
//            searchView.searchTextField.backgroundColor = .wildSand
//            searchView.searchTextField.textColor = .battleShipGray
//            searchView.searchTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: 2.0))
//            searchView.searchTextField.leftViewMode = .always
//            searchView.searchTextField.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: placeholder])
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension MainView: UITableViewDelegate {
//
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var contact = list[indexPath.row]
//        contact.isSelected.toggle()
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension MainView: UITableViewDataSource {
//
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("count")
//        return list.count
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("cell")
//        return configure(Cell.self, with: list[indexPath.row], for: indexPath)
//    }
//
//}

#if DEBUG
import SwiftUI
struct MainViewPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return MainView()
    }
    
    func updateUIView(_ view: UIView, context: Context) {}
}

@available(iOS 13.0, *)
struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainViewPreview()
            .ignoresSafeArea()
    }
}
#endif
