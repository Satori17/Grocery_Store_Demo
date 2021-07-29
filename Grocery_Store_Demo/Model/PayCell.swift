//
//  PayCell.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

class PayCell: UITableViewCell {
    
    @IBOutlet weak var chosenFruitImage: UIImageView!
    @IBOutlet weak var chosenFruitName: UILabel!
    @IBOutlet weak var chosenFruitPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        chosenFruitImage.layer.cornerRadius = 50
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
