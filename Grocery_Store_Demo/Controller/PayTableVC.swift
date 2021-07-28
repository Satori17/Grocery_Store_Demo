//
//  PayTableVC.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

extension PayVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        addedFruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayCell", for: indexPath) as! PayCell
        let currentChosenFruit = addedFruits[indexPath.row]
        cell.chosenFruitImage.image = currentChosenFruit.photo
        cell.chosenFruitName.text = currentChosenFruit.name
        let newQuantity = currentChosenFruit.price * currentChosenFruit.quantity!
        cell.chosenFruitPrice.text = "\(String(format: "%.1f",newQuantity)) ლ"
        
       
        //Shadow for names
        cell.chosenFruitName.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        cell.chosenFruitName.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cell.chosenFruitName.layer.shadowOpacity = 1.0
        
        return  cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
