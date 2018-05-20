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
    enum Money {
        case hasMoney (MoneyValue)
        case noMoney (MoneyValue)
    }
    
    var money: Money? {
        get {
            if let hasMoney = hasMoney {
                return .hasMoney(hasMoney)
            } else if let noMoney = noMoney {
                return .noMoney(noMoney)
            } else {
                return nil
            }
        } set {
            switch newValue {
            case let .hasMoney(value)?: hasMoney = value
            case let .noMoney(value)?: noMoney = value
            default: break
            }
        }
    }
    
    @objc dynamic var hasMoney: MoneyValue?
    @objc dynamic var noMoney: MoneyValue?
}

class MoneyValue: Object {
    @objc dynamic var value = 0.0
}
