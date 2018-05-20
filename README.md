# RealmExample

Very simple example for persisting associated type enum properity 

```
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
```

![simulator screen shot - iphone 7 - 2018-05-20 at 20 05 20](https://user-images.githubusercontent.com/36421922/40282043-35207eb8-5c69-11e8-94fd-f9417ebc7b88.png) <img width="974" alt="screen shot 2018-05-20 at 8 05 27 pm" src="https://user-images.githubusercontent.com/36421922/40282061-86dadbcc-5c69-11e8-8b3b-c3064e0d34c6.png">


