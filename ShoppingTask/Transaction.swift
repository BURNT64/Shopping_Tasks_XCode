class Transaction {
    /** Whether coupons (such as 10p off) can be used for the transaction */
    var couponsEnabled = false
    
    /** All the products being purchased (i.e. the items put through the till) */
    var items = [Product]()
    
    /** Adds up the price of all products in the items collection (without any discount being applied) */
    func priceBeforeDiscounts() -> Int {
        // Calculate the total price of all products before any discounts are applied
        return items.reduce(0) { $0 + $1.price }
    }
    
    /** Calculates the total discount for the products in items */
    func discount() -> Int {
        let discounts = Discounter(couponsEnabled: couponsEnabled).offerDiscounts(list: items)
        var total = 0;
        for discount in discounts {
            total += discount.valueInPence;
        }
        return  total;
    }
    
    /** Returns the final price, which is the price before discount with the discount subtracted */
    func finalPrice() -> Int {
        // First, we calculate the total price before any discounts are applied.
        let totalPriceBeforeDiscounts = priceBeforeDiscounts()
        
        // Next, we retrieve the total discount using the discount method.
        let totalDiscount = discount()
        
        // Then, we subtract the total discount from the price before discounts to get the final price.
        return totalPriceBeforeDiscounts - totalDiscount
    }
}
