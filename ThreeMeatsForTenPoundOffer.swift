///Three meats for a maximum of £10 🍗🍗🍗
class ThreeMeatsForTenPoundOffer : CappedOffer{
    
    var name: String
    var productIds : Set<Int>
    var maxPrice: Int
    var productQuantity : Int
    
    init(){
        name = "Three meats for £10"
        productIds = [301,302,303,304,305,306]
        maxPrice = 1000
        productQuantity = 3
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention CappedOffer in ProtocolExtentions.
    
//    // This method checks if the offer applies based on the eligible products and price cap.
//    func applies(to purchases: [Product]) -> Bool {
//        let eligibleProducts = purchases.filter { productIds.contains($0.id) }
//        
//        // The offer applies if there are enough eligible products and their total price exceeds the max price.
//        guard eligibleProducts.count >= productQuantity else { return false }
//        
//        let topThreePrices = eligibleProducts.sorted(by: { $0.price > $1.price })
//            .prefix(3)
//            .reduce(0) { $0 + $1.price }
//        
//        return topThreePrices > maxPrice
//    }
//    
//    // This method calculates the discount for the eligible products.
//    func discount(for products: [Product]) -> Int {
//        let eligibleProducts = products.filter { productIds.contains($0.id) }
//            .sorted(by: { $0.price > $1.price })
//        
//        var totalDiscount = 0
//        var index = 0
//        
//        // The method processes the eligible products in groups of three and applies the discount.
//        while index + 2 < eligibleProducts.count {
//            let group = [eligibleProducts[index], eligibleProducts[index + 1], eligibleProducts[index + 2]]
//            let groupPrice = group.reduce(0) { $0 + $1.price }
//            
//            // If the total price of the group exceeds the max price, apply the discount.
//            if groupPrice > maxPrice {
//                totalDiscount += groupPrice - maxPrice
//            }
//            
//            index += 3
//        }
//        
//        // Finally, the method returns the total discount.
//        return totalDiscount
//    }
}
