//
//  FruitModel.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit


class Fruit {
    
    var name: String!
    var price: Double = 0.0
    var photo: UIImage!
    var isChosen: Bool?
    var quantity: Double? = 0.0
    
    
    init(name:String, price:Double, photo:UIImage, isChosen:Bool?=nil, quantity: Double?=0.0 ) {
        self.name = name
        self.price = price
        self.photo = photo
        self.isChosen = isChosen
        self.quantity = quantity
    }
}
