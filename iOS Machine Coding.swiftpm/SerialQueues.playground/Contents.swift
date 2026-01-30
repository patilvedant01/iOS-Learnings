import UIKit

class Product {
    var name: String
    private var price: Int
    private var priceAccessQueue: DispatchQueue = DispatchSerialQueue(label: "com.product.price.queue")
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func readPrice() -> Int {
        var price: Int = 0
        priceAccessQueue.sync {
            price = self.price
        }
        return price
    }
    
    func updatePrice(updatedPrice: Int) {
        priceAccessQueue.async { [weak self] in
            guard let self = self else { return }
            self.price = updatedPrice
        }
        return
    }
}

var product = Product(name: "Vedant", price: 10)
product.updatePrice(updatedPrice: 20)
let price = product.readPrice()
print(price)
