//
//  FruitTableVC.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

extension FruitVC: UITableViewDelegate, UITableViewDataSource, HeaderDelegate, ChosenDelegate, PayVCDelegate {
    
    
    func removedFruits(cell: FruitCell) {
        let indexPath = fruitTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        let currentFruit = allFruit[index]
        
        if currentFruit.quantity != nil {
            currentFruit.quantity! -= 1
        }
        fruitTableView.reloadData()
    }
    
    
    func chosenFruits(cell: FruitCell) {
        let indexPath = fruitTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        let currentFruit = allFruit[index]
        
        if currentFruit.quantity == nil {
            currentFruit.quantity = 0
        }
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
        fruitTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allFruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        let currentFruit = allFruit[indexPath.row]
        cell.fruitImage.image = currentFruit.photo
        cell.fruitName.text = currentFruit.name
        cell.fruitPrice.text = "\(currentFruit.price)"
        
        if currentFruit.quantity! > 0 {
            cell.fruitQuantity.text = "\(String(format: "%.1f",currentFruit.quantity!))"
        } else {
            cell.fruitQuantity.text = ""
        }
    
        cell.delegate = self
        
        
        //Shadow for names
        cell.fruitName.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        cell.fruitName.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cell.fruitName.layer.shadowOpacity = 1.0
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderView
        view.delegate = self
        
        
        return view
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
    
}
