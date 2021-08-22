//
//  PayViewController.swift
//  Davaleba_15
//
//  Created by Saba Khitaridze on 24.07.21.
//

import UIKit

class PayVC: UIViewController {

    @IBOutlet weak var overallPriceLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var payTableView: UITableView!
    
    weak var delegate: PayVCDelegate!
    var addedFruits = [Fruit]()
    var sum = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payTableView.delegate = self
        payTableView.dataSource = self
        calcSum()

        //Shadows
        payButton.layer.cornerRadius = 25
        payButton.layer.cornerRadius = 20
        payButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        payButton.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        payButton.layer.shadowOpacity = 1.0
    }
    
    func calcSum() {
        for i in addedFruits {
            sum += i.price * i.quantity!
        }
        overallPriceLabel.text = "\(String(format: "%.1f",sum)) $"
    }
    

    @IBAction func payButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        delegate.removeData()
    }
}
