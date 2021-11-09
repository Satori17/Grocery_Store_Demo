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
        checkoutButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        checkoutButton.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        checkoutButton.layer.shadowOpacity = 1.0
    }
    
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
        
        delegate.headerButton()
    }
}
