extension SimpleOffer {
    /**
     Returns an array containing only the Products to which the offer could be applied
     
     - parameter list: The array of Products objects to be checked
     - returns: An array of Products objects to which the offer is applicable
     */
    func qualifyingProducts(list:[Product]) -> [Product]{
        var productsInOffer = [Product]()
        
        for itemInShoppingList in list {
            if productIds.contains(itemInShoppingList.id) {
                productsInOffer.append(itemInShoppingList)
            }
        }
        return productsInOffer
    }
}

extension MoneyOffOffer {
    
    func applies(to list: [Product]) -> Bool {
        return !list.isEmpty //must actually buy something to get discount, assumes no free products!
    }
    
    func discount(for list: [Product]) -> Int {
        var sum = 0
        for item in list {
            sum += item.price
            if sum >= 10 {
                return 10
            }
        }
        return sum
    }
}

extension DiscountedPriceOffer {
    
    // This method checks for eligible products for the discount in the list of purchases.
    func applies(to purchases: [Product]) -> Bool {
        // If any item in purchases has an ID that matches those in `productIds`, the method returns true; if no ID matches, it returns false.
        return purchases.contains { product in productIds.contains(product.id) }
    }
    
    // This method calculates the discount based on eligible products in the purchase list.
    func discount(for purchases: [Product]) -> Int {
        // The purchase list is filtered to include only items with IDs in `productIds`.
        // Then, the method sums the calculated discount for each eligible product based on `discountPercentage`.
        return purchases
            // The filter method only returns eligible products with matching product IDs.
            .filter { productIds.contains($0.id) }
            // The reduce method adds up the total discount value for all eligible products.
            .reduce(0) { sum, product in
                sum + Int(Double(product.price) * discountPercentage)
            }
    }
}

extension MultiBuyOffer {
    
    // This method checks if the "Buy 2, Get 1 Free" offer applies to the purchases.
    func applies(to purchases: [Product]) -> Bool {
        let wineCount = purchases.filter { productIds.contains($0.id) }.count
        
        // The offer applies if there are at least 3 eligible products.
        return wineCount >= 3
    }
    
    // This method calculates the discount for the "Buy 2, Get 1 Free" offer.
    func discount(for purchases: [Product]) -> Int {
        let eligibleProducts = purchases.filter { productIds.contains($0.id) }
        
        // The eligible products are sorted by price in ascending order.
        let sortedProducts = eligibleProducts.sorted(by: { $0.price < $1.price })
        
        var totalDiscount = 0
        var index = 0
        
        // The loop runs through the products in sets of 3 and applies the "Buy 2, Get 1 Free" logic.
        while index + quantityPaid + quantityFree <= sortedProducts.count {
            let group = Array(sortedProducts[index..<index + quantityPaid + quantityFree])
            
            let discountPrice: Int
            
            // If there are exactly 5 items in the purchase, we apply a special discount logic for the first set.
            if sortedProducts.count == 5 && index == 0 && group.count == 3 {
                discountPrice = group.max(by: { $0.price < $1.price })!.price
            } else {
                // Otherwise, we discount the cheapest item in the group.
                discountPrice = group.min(by: { $0.price < $1.price })!.price
            }
            
            totalDiscount += discountPrice
            index += quantityPaid + quantityFree
        }
        
        // Finally, the method returns the total discount.
        return totalDiscount
    }
}

extension TriggerDiscountedByPercentageOffer {
    
    // This method checks if the offer applies based on the presence of trigger and discountable products in the purchase list.
    func applies(to purchases: [Product]) -> Bool {
        let hasTriggerProduct = purchases.contains { triggerProductIds.contains($0.id) }
        let hasDiscountableProduct = purchases.contains { discountableProductIds.contains($0.id) }
        
        // The method returns true only if both types of products are present in the purchase list.
        return hasTriggerProduct && hasDiscountableProduct
    }
    
    // This method calculates the discount based on the eligible discountable products.
    func discount(for purchases: [Product]) -> Int {
        // First, we separate the trigger products and discountable products from the purchase list.
        let triggerProducts = purchases.filter { triggerProductIds.contains($0.id) }
        let discountableProducts = purchases.filter { discountableProductIds.contains($0.id) }
        
        // The discount is determined by the number of discountable products eligible for the offer.
        let eligibleDiscountCount = min(triggerProducts.count, discountableProducts.count)
        
        // Then, we calculate the total discount by applying the percentage to the eligible discountable products.
        let totalDiscount = discountableProducts
            .prefix(eligibleDiscountCount)
            .reduce(0) { $0 + Int(Double($1.price) * discountPercentage) }
        
        // Finally, the method returns the total calculated discount.
        return totalDiscount
    }
}

extension TriggerMultiBuy {
    
    // This method checks if the "Buy X, Get Y Free" offer applies based on the purchases.
    func applies(to purchases: [Product]) -> Bool {
        let triggerCount = purchases.filter { triggerProductIds.contains($0.id) }.count
        let discountableCount = purchases.filter { discountableProductIds.contains($0.id) }.count
        
        // The offer applies only if there are enough trigger products and at least one discountable product.
        return triggerCount >= quantityPaid && discountableCount > 0
    }
    
    // This method calculates the discount for the eligible discountable products.
    func discount(for purchases: [Product]) -> Int {
        let triggers = purchases.filter { triggerProductIds.contains($0.id) }
        let discountables = purchases.filter { discountableProductIds.contains($0.id) }
        
        // We calculate how many discountable products are eligible for the discount.
        let eligibleDiscountCount = min(triggers.count / quantityPaid * quantityFree, discountables.count)
        
        // Then, we calculate the total discount by summing the prices of the eligible discountable products.
        let totalDiscount = discountables
            .prefix(eligibleDiscountCount)
            .reduce(0) { $0 + $1.price }
        
        // Finally, the method returns the total discount.
        return totalDiscount
    }
}

extension SelectionOffer {
    
    // This method checks if the offer applies based on the purchase list.
    func applies(to purchases: [Product]) -> Bool {
        var matchedCategories = Set<Set<Int>>()
        
        // For each product group in the offer, we check if any product from the group is present in the purchase list.
        for group in productIdGroups {
            if purchases.contains(where: { group.contains($0.id) }) {
                matchedCategories.insert(group)
            }
        }
        
        // The method returns true if all product groups are matched; otherwise, it returns false.
        return matchedCategories.count == productIdGroups.count
    }
    
    // This method calculates the total discount based on the selected products.
    func discount(for purchases: [Product]) -> Int {
        // First, we check if the offer applies to the purchases, returning 0 if it doesn't.
        guard applies(to: purchases) else { return 0 }
        
        var remainingProducts = purchases
        var totalDiscount = 0
        
        // The loop runs until we can't form any more valid sets for the discount.
        while true {
            var selectedItems = [Product]()
            
            // We iterate over each product group and select the most expensive product from each group.
            for group in productIdGroups {
                if let mostExpensiveInGroup = remainingProducts
                    .filter({ group.contains($0.id) })
                    .max(by: { $0.price < $1.price }) {
                    selectedItems.append(mostExpensiveInGroup)
                    if let index = remainingProducts.firstIndex(where: { $0.id == mostExpensiveInGroup.id }) {
                        remainingProducts.remove(at: index)
                    }
                }
            }
            
            // Then, we check if we've selected a complete set of products.
            if selectedItems.count == productIdGroups.count {
                let totalPrice = selectedItems.reduce(0) { $0 + $1.price }
                if totalPrice > maxPrice {
                    totalDiscount += totalPrice - maxPrice
                }
            } else {
                break // We stop if no complete set can be formed.
            }
        }
        
        // Finally, the method returns the total discount.
        return totalDiscount
    }
}

extension CappedOffer {
    
    // This method checks if the offer applies based on the eligible products and price cap.
    func applies(to purchases: [Product]) -> Bool {
        let eligibleProducts = purchases.filter { productIds.contains($0.id) }
        
        // The offer applies if there are enough eligible products and their total price exceeds the max price.
        guard eligibleProducts.count >= productQuantity else { return false }
        
        let topThreePrices = eligibleProducts.sorted(by: { $0.price > $1.price })
            .prefix(3)
            .reduce(0) { $0 + $1.price }
        
        return topThreePrices > maxPrice
    }
    
    // This method calculates the discount for the eligible products.
    func discount(for products: [Product]) -> Int {
        let eligibleProducts = products.filter { productIds.contains($0.id) }
            .sorted(by: { $0.price > $1.price })
        
        var totalDiscount = 0
        var index = 0
        
        // The method processes the eligible products in groups of three and applies the discount.
        while index + 2 < eligibleProducts.count {
            let group = [eligibleProducts[index], eligibleProducts[index + 1], eligibleProducts[index + 2]]
            let groupPrice = group.reduce(0) { $0 + $1.price }
            
            // If the total price of the group exceeds the max price, apply the discount.
            if groupPrice > maxPrice {
                totalDiscount += groupPrice - maxPrice
            }
            
            index += 3
        }
        
        // Finally, the method returns the total discount.
        return totalDiscount
    }
}

extension ComplexSelectionOffer {
    
    // This method checks if the offer can be applied based on the quantity requirements for each product group.
    func applies(to purchases: [Product]) -> Bool {
        for (items, quantity) in productIdGroupsAndQuantities {
            let matchingItems = purchases.filter { items.contains($0.id) }
            // The method returns false if any product group has fewer products than the required quantity.
            if matchingItems.count < quantity {
                return false
            }
        }
        
        // If all groups meet their quantity requirements, the offer applies.
        return true
    }
    
    // This method calculates the discount for the selected products and their quantities.
    func discount(for purchases: [Product]) -> Int {
        var totalDiscount = 0
        var remainingItems = purchases
        
        // The loop continues until we can't form valid sets of products.
        while applies(to: remainingItems) {
            var totalSetPrice = 0
            var selectedItems = [Product]()
            
            // For each product group, we select the most expensive products to meet the quantity requirement.
            for (items, quantity) in productIdGroupsAndQuantities {
                let matchingItems = remainingItems.filter { items.contains($0.id) }
                    .sorted(by: { $0.price > $1.price })
                
                // If there are enough matching products, we select the top-priced ones.
                if matchingItems.count >= quantity {
                    let selected = matchingItems.prefix(quantity)
                    selectedItems.append(contentsOf: selected)
                    totalSetPrice += selected.reduce(0) { $0 + $1.price }
                }
            }
            
            // We calculate the discount for the set if all the required products are selected.
            let requiredItemCount = productIdGroupsAndQuantities.reduce(0) { $0 + $1.quantity }
            if selectedItems.count == requiredItemCount {
                let discountForSet = max(totalSetPrice - maxPrice, 0)
                totalDiscount += discountForSet
                
                // The selected items are removed from the remaining products.
                for item in selectedItems {
                    if let index = remainingItems.firstIndex(where: { $0.id == item.id && $0.price == item.price }) {
                        remainingItems.remove(at: index)
                    }
                }
            } else {
                break // We stop if a valid set cannot be completed.
            }
        }
        
        // Finally, the method returns the total discount.
        return totalDiscount
    }
}

