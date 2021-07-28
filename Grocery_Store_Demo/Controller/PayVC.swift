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

        payButton.layer.cornerRadius = 25
        payTableView.delegate = self
        payTableView.dataSource = self
        calcSum()
    }
    
    func calcSum() {
        for i in addedFruits {
            sum += i.price * i.quantity!
        }
        overallPriceLabel.text = "\(String(format: "%.1f",sum)) ლ"
    }
    

    @IBAction func payButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        delegate.removeData()
    }
}
