///Get 20% off on 1 pint Milk with every 2 pint Milk purchased
class MilkOffer : TriggerDiscountedByPercentageOffer {
    var name: String
    var triggerProductIds : Set<Int>
    var discountableProductIds : Set<Int>
    var discountPercentage : Double
    
    init() {
        name = "20% off on 1 pint Milk"
        triggerProductIds = [138] //2 pint Milk
        discountableProductIds = [137] //1 pint Milk
        discountPercentage  = 0.2
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention TriggerDiscountedByPercentageOffer in ProtocolExtentions.
    
//    // This method checks if the offer applies based on the presence of trigger and discountable products in the purchase list.
//    func applies(to purchases: [Product]) -> Bool {
//        let hasTriggerProduct = purchases.contains { triggerProductIds.contains($0.id) }
//        let hasDiscountableProduct = purchases.contains { discountableProductIds.contains($0.id) }
//        
//        // The method returns true only if both types of products are present in the purchase list.
//        return hasTriggerProduct && hasDiscountableProduct
//    }
//    
//    // This method calculates the discount based on the eligible discountable products.
//    func discount(for purchases: [Product]) -> Int {
//        // First, we separate the trigger products and discountable products from the purchase list.
//        let triggerProducts = purchases.filter { triggerProductIds.contains($0.id) }
//        let discountableProducts = purchases.filter { discountableProductIds.contains($0.id) }
//        
//        // The discount is determined by the number of discountable products eligible for the offer.
//        let eligibleDiscountCount = min(triggerProducts.count, discountableProducts.count)
//        
//        // Then, we calculate the total discount by applying the percentage to the eligible discountable products.
//        let totalDiscount = discountableProducts
//            .prefix(eligibleDiscountCount)
//            .reduce(0) { $0 + Int(Double($1.price) * discountPercentage) }
//        
//        // Finally, the method returns the total calculated discount.
//        return totalDiscount
//    }
}

