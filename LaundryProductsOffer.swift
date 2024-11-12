///Buy a certain number if items from of each group and pay £20.99 (e.g. 2 detergents, 1 softener and 1 conditioner)
class LaundryProductsOffer : ComplexSelectionOffer {
    
    var productIdGroupsAndQuantities: Array<(items: Set<Int>, quantity: Int)>
    var maxPrice: Int
    var name: String
    
    init(){
        let detergents = [617, 618]
        let softeners = [620, 621]
        let conditioner = [619]
        
        let detergentRule = (items: Set(detergents), quantity: 2)
        let softenerRule = (items: Set(softeners), quantity: 1)
        let conditionerRule = (items: Set(conditioner), quantity: 1)
        
        name = "Laundry Products Offer"
        productIdGroupsAndQuantities = [detergentRule, softenerRule, conditionerRule]
        maxPrice = 2099
    }
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention ComplexSelectionOffer in ProtocolExtentions.
    
//    // This method checks if the offer can be applied based on the quantity requirements for each product group.
//    func applies(to purchases: [Product]) -> Bool {
//        for (items, quantity) in productIdGroupsAndQuantities {
//            let matchingItems = purchases.filter { items.contains($0.id) }
//            // The method returns false if any product group has fewer products than the required quantity.
//            if matchingItems.count < quantity {
//                return false
//            }
//        }
//        
//        // If all groups meet their quantity requirements, the offer applies.
//        return true
//    }
//    
//    // This method calculates the discount for the selected products and their quantities.
//    func discount(for purchases: [Product]) -> Int {
//        var totalDiscount = 0
//        var remainingItems = purchases
//        
//        // The loop continues until we can't form valid sets of products.
//        while applies(to: remainingItems) {
//            var totalSetPrice = 0
//            var selectedItems = [Product]()
//            
//            // For each product group, we select the most expensive products to meet the quantity requirement.
//            for (items, quantity) in productIdGroupsAndQuantities {
//                let matchingItems = remainingItems.filter { items.contains($0.id) }
//                    .sorted(by: { $0.price > $1.price })
//                
//                // If there are enough matching products, we select the top-priced ones.
//                if matchingItems.count >= quantity {
//                    let selected = matchingItems.prefix(quantity)
//                    selectedItems.append(contentsOf: selected)
//                    totalSetPrice += selected.reduce(0) { $0 + $1.price }
//                }
//            }
//            
//            // We calculate the discount for the set if all the required products are selected.
//            let requiredItemCount = productIdGroupsAndQuantities.reduce(0) { $0 + $1.quantity }
//            if selectedItems.count == requiredItemCount {
//                let discountForSet = max(totalSetPrice - maxPrice, 0)
//                totalDiscount += discountForSet
//                
//                // The selected items are removed from the remaining products.
//                for item in selectedItems {
//                    if let index = remainingItems.firstIndex(where: { $0.id == item.id && $0.price == item.price }) {
//                        remainingItems.remove(at: index)
//                    }
//                }
//            } else {
//                break // We stop if a valid set cannot be completed.
//            }
//        }
//        
//        // Finally, the method returns the total discount.
//        return totalDiscount
//    }
}
