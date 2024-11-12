///Buy one item from each category and pay just £10
class DineInFor2For10PoundsOffer : SelectionOffer {
    var productIdGroups: Set<Set<Int>>
    
    var maxPrice: Int
    
    var name: String
    
    init(){
        
        let sideIds : Set<Int> = [1011,1012] //garlic bread, mushrooms
        let mainIds : Set<Int> = [305,306] //pork chops, chicken drumsticks
        let dessertIds : Set<Int> = [1001,1002,1003] //choc puding, tiramisu, profiteroles
        let wineIds : Set<Int> = [901,902] //sauv blanc, cabernet sauvignon
        
        productIdGroups = [sideIds,mainIds,dessertIds,wineIds]
        maxPrice = 1000
        
        name = "Dine in for 2 for £10"
    }
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention SelectionOffer in ProtocolExtentions.
    
//    // This method checks if the offer applies based on the purchase list.
//    func applies(to purchases: [Product]) -> Bool {
//        var matchedCategories = Set<Set<Int>>()
//        
//        // For each product group in the offer, we check if any product from the group is present in the purchase list.
//        for group in productIdGroups {
//            if purchases.contains(where: { group.contains($0.id) }) {
//                matchedCategories.insert(group)
//            }
//        }
//        
//        // The method returns true if all product groups are matched; otherwise, it returns false.
//        return matchedCategories.count == productIdGroups.count
//    }
//    
//    // This method calculates the total discount based on the selected products.
//    func discount(for purchases: [Product]) -> Int {
//        // First, we check if the offer applies to the purchases, returning 0 if it doesn't.
//        guard applies(to: purchases) else { return 0 }
//        
//        var remainingProducts = purchases
//        var totalDiscount = 0
//        
//        // The loop runs until we can't form any more valid sets for the discount.
//        while true {
//            var selectedItems = [Product]()
//            
//            // We iterate over each product group and select the most expensive product from each group.
//            for group in productIdGroups {
//                if let mostExpensiveInGroup = remainingProducts
//                    .filter({ group.contains($0.id) })
//                    .max(by: { $0.price < $1.price }) {
//                    selectedItems.append(mostExpensiveInGroup)
//                    if let index = remainingProducts.firstIndex(where: { $0.id == mostExpensiveInGroup.id }) {
//                        remainingProducts.remove(at: index)
//                    }
//                }
//            }
//            
//            // Then, we check if we've selected a complete set of products.
//            if selectedItems.count == productIdGroups.count {
//                let totalPrice = selectedItems.reduce(0) { $0 + $1.price }
//                if totalPrice > maxPrice {
//                    totalDiscount += totalPrice - maxPrice
//                }
//            } else {
//                break // We stop if no complete set can be formed.
//            }
//        }
//        
//        // Finally, the method returns the total discount.
//        return totalDiscount
//    }
}
