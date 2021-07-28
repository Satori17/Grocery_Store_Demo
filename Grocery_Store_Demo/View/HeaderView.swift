//
//  HeaderView.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit


class HeaderView: UIView  {
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    weak var delegate: HeaderDelegate!
   
    
    override func draw(_ rect: CGRect) {
        checkoutButton.layer.cornerRadius = 20

    }
    
    
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
        
        delegate.headerButton()
    }
}
