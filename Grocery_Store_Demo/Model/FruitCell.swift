//
//  FruitCell.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

class FruitCell: UITableViewCell {
  
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitPrice: UILabel!
    @IBOutlet weak var fruitQuantity: UILabel!
    
    weak var delegate: ChosenDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fruitQuantity.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        delegate.removedFruits(cell: self)
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        delegate.chosenFruits(cell: self)
    }
}

