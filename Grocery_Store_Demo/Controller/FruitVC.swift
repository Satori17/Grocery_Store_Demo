//
//  ViewController.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

class FruitVC: UIViewController {
    
    @IBOutlet weak var fruitTableView: UITableView!
    
    
    var allFruit = [ Fruit(name: "Pineapple", price: 8.8, photo: #imageLiteral(resourceName: "Pineapple")),
                     Fruit(name: "Apple", price: 2.4, photo: #imageLiteral(resourceName: "Apple")),
                     Fruit(name: "Strawberry", price: 3.3, photo: #imageLiteral(resourceName: "Strawberry")),
                     Fruit(name: "Cherry", price: 4.1, photo: #imageLiteral(resourceName: "Cherry")),
                     Fruit(name: "Banana", price: 1.2, photo: #imageLiteral(resourceName: "Banana")),
                     Fruit(name: "Blueberry", price: 7.8, photo: #imageLiteral(resourceName: "Blueberry")),
                     Fruit(name: "Mandarin", price: 6.5, photo: #imageLiteral(resourceName: "Mandarin")),
                     Fruit(name: "Watermelon", price: 5.4, photo: #imageLiteral(resourceName: "Watermelon"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTableView.delegate = self
        fruitTableView.dataSource = self
    }
    
}

