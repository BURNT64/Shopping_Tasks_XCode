class Discounter {
    
    private var offers : [Offer]
    
    init(couponsEnabled : Bool = false){
        
        offers = [Offer]()
        
        //add all potential offers to an array
        if couponsEnabled {
            offers.append(TenPenceOffOffer())
        }
        
        offers.append(SeventyPercentOffOffer())
        offers.append(BuyTwoGetThirdFreeOffer())
        offers.append(FreeSauceWithMeatOffer())
        offers.append(FreeCokeZeroWith2OtherCokesOffer())
        offers.append(DineInFor2For10PoundsOffer())
        offers.append(FreeWaterWithNewspaperOffer())
        offers.append(MilkOffer())
       
        offers.append(ThreeMeatsForTenPoundOffer())
       
        offers.append(LaundryProductsOffer())
        offers.append(WinterWarmerOffer())
    }
    
    func offerDiscounts(list: [Product]) -> [OfferDetail]{
        
        var discountDetail = [OfferDetail]()
        
        //run through each offer
        for offer in offers{
            if offer.applies(to: list) {
                let discountValue = offer.discount(for: list)
                
                let line = OfferDetail(name: offer.name, valueInPence: discountValue)
                discountDetail.append(line)
            }
        }
        return discountDetail
    }
    
    
    class OfferDetail {
        
        var name:String
        var valueInPence:Int
        
        init(name:String, valueInPence:Int){
            self.name = name;
            self.valueInPence = valueInPence
        }
    }
}

