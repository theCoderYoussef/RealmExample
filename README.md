# RealmExample

Very simple example for persisting associated type enum properity 

```
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
```
<img width="1214" alt="screen shot 2018-05-20 at 10 01 58 pm" src="https://user-images.githubusercontent.com/36421922/40283265-da78f054-5c7b-11e8-8ac5-494566d5d338.png">
