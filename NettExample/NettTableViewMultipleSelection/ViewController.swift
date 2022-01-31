import UIKit
import Nett

// # 4 View Controller
class ViewController: UIViewController {
    
    var mainView: MainView {
        view as! MainView
    }
    
    var list: [Contact] = [
        .init(name: "Kojo"),
        .init(name: "Kwabena"),
        .init(name: "Kwaku"),
        .init(name: "Yao"),
        .init(name: "Kofi"),
        .init(name: "Kwame"),
        .init(name: "Kwasi")
    ]
    
    var filteredList = [Contact]()
    
    public override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        filteredList = list
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.button.addAction { [weak self] in
            guard let self = self else { return }
            self.mainView.isAllSelected.toggle()
            self.mainView.button.setTitle(self.mainView.isAllSelected ? "Select All" : "Deselect All", for: .normal)
            if self.mainView.isFiltering {
                self.filteredList = self.filteredList.map {
                    var update = $0
                    update.isSelected = self.mainView.isAllSelected
                    return update
                }
            } else {
                self.list = self.list.map {
                    var update = $0
                    update.isSelected = self.mainView.isAllSelected
                    return update
                }
            }
            self.mainView.tableView.reloadData()
        }
        
        mainView.searchView.delegate = self
 
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainView.isFiltering ?
        filteredList[indexPath.row].isSelected.toggle() :
        list[indexPath.row].isSelected.toggle()
        self.mainView.isAllSelected = false
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainView.isFiltering ? filteredList.count : list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        mainView.isFiltering ?
        mainView.configure(Cell.self, with: filteredList[indexPath.row], for: indexPath) :
        mainView.configure(Cell.self, with: list[indexPath.row], for: indexPath)
    }
    
}

// # 7 UISearchBarDelegate
extension ViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        mainView.isFiltering = true
    }

    // # 8 merges filtered list back into main list
    func merge() {
        list = list.map { contact in
            filteredList.first(where: { $0.id == contact.id }) ?? contact
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if !searchText.isEmpty {
            filteredList = list
            mainView.isFiltering = true
            filteredList = list.filter {
             $0.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            mainView.isFiltering = false
            merge()
        }
        
        mainView.tableView.reloadData()
        
    }

}


import SwiftUI
struct ViewControllerPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    
}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview().ignoresSafeArea()
            .preferredColorScheme(.dark)
        ViewControllerPreview().ignoresSafeArea()
    }
}

