//
//  ViewController.swift
//  RealmExample
//
//  Created by youssefTheCoder on 5/20/18.
//  Copyright © 2018 mentorastudio. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    var moneyValue: MoneyValue?
    var moneyValue2: MoneyValue?
    var pocket: Pocket?
    
    @IBOutlet weak var hasMoneyTxt: UITextField!
    @IBOutlet weak var hasMonLbl: UILabel!
    @IBOutlet weak var noMonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    @IBAction func save(_ sender: UIButton) {
        guard
            let hasMoneyTxt = hasMoneyTxt.text,
            Double(hasMoneyTxt) != nil else { return }
       
        makeMoney()
        instPocket()

        try! realm.write {
            realm.add(pocket!)
        }
        
        DispatchQueue.main.async { self.view.endEditing(true) }
    }
    
    @IBAction func load(_ sender: UIButton) {
        guard let pocket = realm.objects(Pocket.self).first else { return }
        
        hasMonLbl.text = "money: \(pocket.hasMoney!.value)"
        noMonLbl.text = "noMoney: \(pocket.noMoney.rawValue)"
    }
    
    func makeMoney() {
        moneyValue = MoneyValue()
        
        moneyValue!.value = Double(hasMoneyTxt.text!)!
    }
    
    func instPocket() {
        pocket = Pocket()
        
        pocket!.money = .hasMoney(moneyValue!)
        pocket!.noMoney = .noMoney
    }
}

