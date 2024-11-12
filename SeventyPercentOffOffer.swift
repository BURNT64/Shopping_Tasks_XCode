///70% discount on 🍪
class SeventyPercentOffOffer : DiscountedPriceOffer {
    
    var name: String
    var productIds : Set<Int>
    var discountPercentage: Double
    
    init(){
        name = "70% off on Cookies"
        productIds = [2007];
        discountPercentage = 0.7
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention DiscountedPriceOffer  in ProtocolExtentions.
    
//    // This method checks for eligible products for the discount in the list of purchases.
//    func applies(to purchases: [Product]) -> Bool {
//        // If any item in purchases has an ID that matches those in `productIds`, the method returns true; if no ID matches, it returns false.
//        return purchases.contains { product in productIds.contains(product.id) }
//    }
//    
//    // This method calculates the discount based on eligible products in the purchase list.
//    func discount(for purchases: [Product]) -> Int {
//        // The purchase list is filtered to include only items with IDs in `productIds`.
//        // Then, the method sums the calculated discount for each eligible product based on `discountPercentage`.
//        return purchases
//            // The filter method only returns eligible products with matching product IDs.
//            .filter { productIds.contains($0.id) }
//            // The reduce method adds up the total discount value for all eligible products.
//            .reduce(0) { sum, product in
//                sum + Int(Double(product.price) * discountPercentage)
//            }
//    }
}
