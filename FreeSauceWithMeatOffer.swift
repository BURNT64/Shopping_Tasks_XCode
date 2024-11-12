///Free Table Sauce with 🍗🍗🍗
class FreeSauceWithMeatOffer : TriggerMultiBuy {
    
    var triggerProductIds: Set<Int>
    var discountableProductIds: Set<Int>
    var quantityFree: Int
    var name: String
    var quantityPaid: Int
    var productIds: Set<Int>
    
    init(){
        name = "Free Sauce with Meat"
        triggerProductIds = [301,302,303,304,305,306]
        discountableProductIds = [54321, 54322]
        quantityPaid = 3;
        quantityFree = 2;
        productIds = triggerProductIds.union(discountableProductIds)
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention TriggerMultiBuy in ProtocolExtentions.
    
//    // This method checks if the "Buy X, Get Y Free" offer applies based on the purchases.
//    func applies(to purchases: [Product]) -> Bool {
//        let triggerCount = purchases.filter { triggerProductIds.contains($0.id) }.count
//        let discountableCount = purchases.filter { discountableProductIds.contains($0.id) }.count
//        
//        // The offer applies only if there are enough trigger products and at least one discountable product.
//        return triggerCount >= quantityPaid && discountableCount > 0
//    }
//    
//    // This method calculates the discount for the eligible discountable products.
//    func discount(for purchases: [Product]) -> Int {
//        let triggers = purchases.filter { triggerProductIds.contains($0.id) }
//        let discountables = purchases.filter { discountableProductIds.contains($0.id) }
//        
//        // We calculate how many discountable products are eligible for the discount.
//        let eligibleDiscountCount = min(triggers.count / quantityPaid * quantityFree, discountables.count)
//        
//        // Then, we calculate the total discount by summing the prices of the eligible discountable products.
//        let totalDiscount = discountables
//            .prefix(eligibleDiscountCount)
//            .reduce(0) { $0 + $1.price }
//        
//        // Finally, the method returns the total discount.
//        return totalDiscount
//    }
}
