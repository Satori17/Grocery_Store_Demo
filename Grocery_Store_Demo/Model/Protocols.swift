//
//  Protocols.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit


protocol HeaderDelegate: AnyObject {
    func headerButton()
}

protocol ChosenDelegate: AnyObject {
    func chosenFruits(cell: FruitCell)
    func removedFruits(cell: FruitCell)
}

protocol PayVCDelegate: AnyObject {
    func removeData()
}
