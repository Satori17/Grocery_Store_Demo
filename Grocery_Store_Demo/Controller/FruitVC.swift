//
//  ViewController.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

class FruitVC: UIViewController {
    
    
    @IBOutlet weak var fruitTableView: UITableView!
    
    var fruitCounterForHeader = 0
    let searchController = UISearchController()
    var filteredFruits: [Fruit]!
    
    
    var allFruit = [ Fruit(name: "Pineapple", price: 7.8, photo: #imageLiteral(resourceName: "Pineapple")),
                     Fruit(name: "Strawberry", price: 2.3, photo: #imageLiteral(resourceName: "Strawberry")),
                     Fruit(name: "Cherry", price: 3.1, photo: #imageLiteral(resourceName: "Cherry")),
                     Fruit(name: "Banana", price: 1.2, photo: #imageLiteral(resourceName: "Banana")),
                     Fruit(name: "Blueberry", price: 6.8, photo: #imageLiteral(resourceName: "Blueberry")),
                     Fruit(name: "Mandarin", price: 5.5, photo: #imageLiteral(resourceName: "Mandarin")),
                     Fruit(name: "Watermelon", price: 4.3, photo: #imageLiteral(resourceName: "Watermelon")),
                     Fruit(name: "Apricot", price: 4, photo: #imageLiteral(resourceName: "Apricot")),
                     Fruit(name: "Fig", price: 5.7, photo: #imageLiteral(resourceName: "Fig")),
                     Fruit(name: "Grape", price: 6, photo: #imageLiteral(resourceName: "Grape")),
                     Fruit(name: "Artichoke", price: 6.2, photo: #imageLiteral(resourceName: "Artichoke")),
                     Fruit(name: "Lemon", price: 1.1, photo: #imageLiteral(resourceName: "Lemon")),
                     Fruit(name: "Lime", price: 1.5, photo: #imageLiteral(resourceName: "Lime")),
                     Fruit(name: "Apple", price: 1.4, photo: #imageLiteral(resourceName: "Apple")),
                     Fruit(name: "Plum", price: 3.2, photo: #imageLiteral(resourceName: "Plum")),
                     Fruit(name: "Grapefruit", price: 5.9, photo: #imageLiteral(resourceName: "GrapeFruit")),
                     Fruit(name: "Raspberry", price: 7, photo: #imageLiteral(resourceName: "Raspberry")),
                     Fruit(name: "Mango", price: 8.3, photo: #imageLiteral(resourceName: "Mango")),
                     Fruit(name: "Avocado", price: 4.9, photo: #imageLiteral(resourceName: "Avocado")),
                     Fruit(name: "Coconut", price: 8.5, photo: #imageLiteral(resourceName: "Coconut")),
                     Fruit(name: "Kiwi", price: 3.2, photo: #imageLiteral(resourceName: "Kiwi")),
                     Fruit(name: "Orange", price: 3.5, photo: #imageLiteral(resourceName: "Orange")),
                     Fruit(name: "Jackfruit", price: 7.6, photo: #imageLiteral(resourceName: "Jackfruit")),
                     Fruit(name: "Pomegranate", price: 6.4, photo: #imageLiteral(resourceName: "Pomegranate")),
                     Fruit(name: "Pear", price: 2.9, photo: #imageLiteral(resourceName: "Pear"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTableView.delegate = self
        fruitTableView.dataSource = self
        showSearchBar()
        filteredFruits = allFruit
    }
    
    //Creating search bar
    func showSearchBar() {
        title = "Grocery Store"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.search
        //searchController.searchBar.scopeButtonTitles = ["Fruits", "Vegetables"]
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.loadViewIfNeeded()
        //placeholder and text color changes
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search Fruit", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
}

