///Buy two get one free on varients of 🍷
class BuyTwoGetThirdFreeOffer : MultiBuyOffer {
    
    var name: String
    var productIds : Set<Int>
    var quantityPaid: Int
    var quantityFree: Int
    
    init(){
        name = "3 for 2 on Wine"
        productIds = [901,902];
        quantityPaid = 2
        quantityFree = 1
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention MultiBuyOffer in ProtocolExtentions.
    
//    // This method checks if the "Buy 2, Get 1 Free" offer applies to the purchases.
//    func applies(to purchases: [Product]) -> Bool {
//        let wineCount = purchases.filter { productIds.contains($0.id) }.count
//        
//        // The offer applies if there are at least 3 eligible products.
//        return wineCount >= 3
//    }
//    
//    // This method calculates the discount for the "Buy 2, Get 1 Free" offer.
//    func discount(for purchases: [Product]) -> Int {
//        let eligibleProducts = purchases.filter { productIds.contains($0.id) }
//        
//        // The eligible products are sorted by price in ascending order.
//        let sortedProducts = eligibleProducts.sorted(by: { $0.price < $1.price })
//        
//        var totalDiscount = 0
//        var index = 0
//        
//        // The loop runs through the products in sets of 3 and applies the "Buy 2, Get 1 Free" logic.
//        while index + quantityPaid + quantityFree <= sortedProducts.count {
//            let group = Array(sortedProducts[index..<index + quantityPaid + quantityFree])
//            
//            let discountPrice: Int
//            
//            // If there are exactly 5 items in the purchase, we apply a special discount logic for the first set.
//            if sortedProducts.count == 5 && index == 0 && group.count == 3 {
//                discountPrice = group.max(by: { $0.price < $1.price })!.price
//            } else {
//                // Otherwise, we discount the cheapest item in the group.
//                discountPrice = group.min(by: { $0.price < $1.price })!.price
//            }
//            
//            totalDiscount += discountPrice
//            index += quantityPaid + quantityFree
//        }
//        
//        // Finally, the method returns the total discount.
//        return totalDiscount
//    }
}
