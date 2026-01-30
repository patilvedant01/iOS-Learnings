import UIKit

class Product {
    var name: String
    private var price: Int
    private var semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func readPrice() -> Int {
        semaphore.wait()
        defer {
            semaphore.signal()
        }
        return price
    }
    
    func updatePrice(updatedPrice: Int) {
        semaphore.wait()
        defer {
            semaphore.signal()
        }
        self.price = updatedPrice
    }
}
