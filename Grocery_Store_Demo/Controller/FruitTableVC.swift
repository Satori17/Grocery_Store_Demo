//
//  FruitTableVC.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

extension FruitVC: UITableViewDelegate, UITableViewDataSource, HeaderDelegate, ChosenDelegate, PayVCDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    func removedFruits(cell: FruitCell) {
        let indexPath = fruitTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        let currentFruit: Fruit!
        
        if searchController.isActive {
            currentFruit = filteredFruits[index]
        } else {
            currentFruit = allFruit[index]
        }
        
        if currentFruit.quantity != 0 {
            currentFruit.quantity! -= 1
            fruitCounterForHeader -= 1
        }
        fruitTableView.reloadData()
    }
    
    func chosenFruits(cell: FruitCell) {
        let indexPath = fruitTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        let currentFruit: Fruit!
        
        if searchController.isActive {
            currentFruit = filteredFruits[index]
        } else {
            currentFruit = allFruit[index]
        }
        
        if currentFruit.quantity == nil {
            currentFruit.quantity = 0
        }
        fruitCounterForHeader += 1
        currentFruit.quantity! += 1
        fruitTableView.reloadData()
    }
    
    
    func headerButton() {
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = myStoryboard.instantiateViewController(withIdentifier: "PayVC") as! PayVC
        
        for i in allFruit {
            if i.quantity! > 0 {
                secondVC.addedFruits.append(i)
            }
        }
        
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func removeData() {
        for fruit in allFruit{
            fruit.quantity = 0
        }
        navigationController?.navigationBar.isHidden = false
        fruitCounterForHeader = 0
        fruitTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredFruits.count
        }
       return allFruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        let currentFruit: Fruit!
       
        
        if searchController.isActive {
            currentFruit = filteredFruits[indexPath.row]
        } else {
            currentFruit = allFruit[indexPath.row]
        }
        
        
        cell.fruitImage.image = currentFruit.photo
        cell.fruitName.text = currentFruit.name
        cell.fruitPrice.text = "\(currentFruit.price) $"
        if currentFruit.quantity! > 0 {
            cell.fruitQuantity.text = "\(String(format: "%.0f",currentFruit.quantity!))"
        } else {
            cell.fruitQuantity.text = ""
        }
        cell.delegate = self
        
        //Shadow for names
        cell.fruitName.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        cell.fruitName.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        cell.fruitName.layer.shadowOpacity = 0.5

        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderView
        view.delegate = self
        
        if fruitCounterForHeader > 0 {
            view.isHidden = false
        } else {
            view.isHidden = true
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if fruitCounterForHeader > 0 {
            return 80
        } else {
            return 10
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        filterFruits(searchText: searchText)
    }
    
    
    func filterFruits(searchText: String) {
        filteredFruits = allFruit.filter({ Fruit in
            if searchController.searchBar.text != "" {
                let searchTextMatch = Fruit.name.lowercased().hasPrefix(searchText.lowercased())
                return searchTextMatch
            } else {
                    return true
            }
        })
        fruitTableView.reloadData()
    }
    
}
