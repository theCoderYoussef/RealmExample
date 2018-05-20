//
//  Pocket.swift
//  RealmExample
//
//  Created by youssefTheCoder on 5/20/18.
//  Copyright © 2018 mentorastudio. All rights reserved.
//

import Foundation
import RealmSwift

class Pocket: Object {
    enum Money: Int {
        enum HasMoney {
            case hasMoney (MoneyValue)
        }
        case noMoney = 0
    }
    
    var money: Money.HasMoney? {
        get {
            if let hasMoney = hasMoney {
                return .hasMoney(hasMoney)
            } else {
                return nil
            }
        } set {
            switch newValue {
            case let .hasMoney(value)?: hasMoney = value
            default: break
            }
        }
    }
    
    @objc private (set) dynamic var hasMoney: MoneyValue?
    @objc private dynamic var noMoneyValue = Money.noMoney.rawValue
    
    var noMoney: Money {
        get { return Money(rawValue: noMoneyValue)! }
        set { noMoneyValue = newValue.rawValue }
    }
}

class MoneyValue: Object {
    @objc dynamic var value = 0.0
}
