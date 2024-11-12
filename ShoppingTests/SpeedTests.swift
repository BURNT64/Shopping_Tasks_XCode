import XCTest

class K_SpeedTests: XCTestCase {
    func testSeventyPercentOff(){
        let testProducts = [P.🍪,P.🍪]
        XCTAssertTrue(Helper.shared.offer(SeventyPercentOffOffer(), hasFasterAppliesMethodWith: testProducts), "70%off 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
    func testBuyTwoGetThirdFree(){
        let testProducts = [P.dove, P.dove, P.dove, P.lynx, P.lynx, P.lynx]
        XCTAssertTrue(Helper.shared.offer(BuyTwoGetThirdFreeOffer(), hasFasterAppliesMethodWith: testProducts), "B2G3F 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    func testWaterPaper(){
        let testProducts = [P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.💧]
        XCTAssertTrue(Helper.shared.offer(FreeWaterWithNewspaperOffer(), hasFasterAppliesMethodWith: testProducts), "FreeWaterWithNewspaper 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    func testFreeSauce(){
        let testProducts = [P.mayo, P.ketchup]
        XCTAssertTrue(Helper.shared.offer(FreeSauceWithMeatOffer(), hasFasterAppliesMethodWith: testProducts))
    }
    func testFreeCokeZero(){
        let testProducts = [P.coke,P.coke,P.cokezero]
        XCTAssertTrue(Helper.shared.offer(FreeCokeZeroWith2OtherCokesOffer(), hasFasterAppliesMethodWith: testProducts))
    }
    func testDineIn(){
        XCTAssertTrue(Helper.shared.offer(DineInFor2For10PoundsOffer(), hasFasterAppliesMethodWith: [P.🍷,P.🍗,P.mushrooms,P.chocPudding]))
    }
    func testThreeMeat(){
        let testProducts = [P.chicken,P.chicken,P.smokedBacon,P.unsmokedBacon,P.chicken,P.mince,P.porkChops, P.chocPudding]
        XCTAssertTrue(Helper.shared.offer(ThreeMeatsForTenPoundOffer(), hasFasterAppliesMethodWith: testProducts), "ThreeMeatsForTenPound 'applies' method should be quicker than its 'discount' method")
    }
    
    func testWinterWarmer(){
        XCTAssertTrue(Helper.shared.offer(WinterWarmerOffer(), hasFasterAppliesMethodWith: [P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪, P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪]), "WinterWarmer 'applies' method should be quicker than its 'discount' method")
    }
    
    func testMilk(){
        let testProducts = [P.onePintMilk, P.twoPintMilk]
        XCTAssertTrue(Helper.shared.offer(MilkOffer(), hasFasterAppliesMethodWith: testProducts), " 20% off on 1 pint Milk with every 2 pint Milk purchased 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
    func testLaundryProducts(){
        let testProducts = [P.ariel, P.comfortSoftener, P.genericSoftener]
        XCTAssertTrue(Helper.shared.offer(LaundryProductsOffer(), hasFasterAppliesMethodWith: testProducts), "Laundry Products Offer 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
}
