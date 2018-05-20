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
    @IBOutlet weak var noMoneyTxt: UITextField!
    @IBOutlet weak var hasMonLbl: UILabel!
    @IBOutlet weak var noMonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    @IBAction func save(_ sender: UIButton) {
        guard
            let hasMoneyTxt = hasMoneyTxt.text,
            let noMoneyTxt = noMoneyTxt.text,
            Double(hasMoneyTxt) != nil, Double(noMoneyTxt) != nil else { return }
       
        makeMoney()
        instPocket()

        try! realm.write {
            realm.add(pocket!)
        }
    }
    
    @IBAction func load(_ sender: UIButton) {
        guard let pocket = realm.objects(Pocket.self).first else { return }
        
        hasMonLbl.text = "\(pocket.hasMoney!.value)"
        noMonLbl.text = "\(pocket.noMoney!.value)"
    }
    
    func makeMoney() {
        moneyValue = MoneyValue()
        moneyValue2 = MoneyValue()
        
        moneyValue!.value = Double(hasMoneyTxt.text!)!
        moneyValue2!.value = Double(noMoneyTxt.text!)!
    }
    
    func instPocket() {
        pocket = Pocket()
        
        pocket!.money = .hasMoney(moneyValue!)
        pocket!.money = .noMoney(moneyValue2!)
    }
}

