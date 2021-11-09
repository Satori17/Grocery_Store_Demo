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
        
        navigationController?.navigationBar.isHidden = true
        payTableView.bounces = false
        
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
        
        //Adding subview to payVC
        let view = UIView(frame: CGRect(x: 0, y: 0, width: .max, height: .max))
        view.backgroundColor = #colorLiteral(red: 0.1869574189, green: 0.6311674118, blue: 1, alpha: 1)
        //Adding activity indicator to PayVC
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 200))
        indicator.center = self.view.center
        indicator.style = .large
        indicator.startAnimating()
        indicator.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        indicator.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        indicator.layer.shadowOpacity = 1
        indicator.layer.shadowOffset = .init(width: 2, height: 2)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PayVC") as! PayVC
        self.addChild(vc)
        self.view.addSubview(view)
        self.view.addSubview(indicator)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController?.popViewController(animated: true)
            if self.addedFruits.count > 0 {
                self.delegate.removeData()
            }
        }
    }
}
