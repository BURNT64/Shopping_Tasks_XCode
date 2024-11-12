import XCTest

class H_TriggerDiscountedByPercentageTests: XCTestCase {

    var offer : FreeWaterWithNewspaperOffer!
    
    override func setUp() {
        super.setUp()
        offer = FreeWaterWithNewspaperOffer()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        offer = nil
        super.tearDown()
    }

    // MARK: Simple Trigger Offer
    func waterApplies(){
        let offer = FreeWaterWithNewspaperOffer()
        XCTAssertFalse(offer.applies(to: [P.smokedBacon]))
        XCTAssertFalse(offer.applies(to: [P.smokedBacon, P.smokedBacon])) //2 bacon
        XCTAssertFalse(offer.applies(to: [P.💧]))
        XCTAssertFalse(offer.applies(to: [P.💧,P.💧]))
        XCTAssertFalse(offer.applies(to: [P.📰]))
        XCTAssertFalse(offer.applies(to: [P.📰,P.📰]))
        XCTAssertTrue(offer.applies(to: [P.📰,P.💧]))
        XCTAssertTrue(offer.applies(to: [P.💧,P.📰]))
    }
    
    
    func testWaterApplicable(){
        waterApplies()
    }
    
    func testPriceChange(){
        waterApplies()
        let water = P.💧
        let waterOriginalPrice = water.price
        water.price = 200
        let list = [water,P.📰]
        XCTAssertEqual(offer.discount(for:list), 200, "offer works with change in water price")
        water.price = waterOriginalPrice //needs to be put back as will persist for other tests
    }
    
    
    func testTwoWaterWithOnePaper(){
        waterApplies()
        let list = [P.💧,P.📰,P.💧]
        XCTAssertEqual(offer.discount(for:list) ,P.💧.price * 1, "1 x water correctly discounted")
    }
    
    func testMoreWatersThanPapers(){
        waterApplies()
        var list = [P.📰,P.📰,P.💧,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 2, "2 x water correctly discounted")
        list = [P.📰,P.📰,P.📰,P.💧,P.💧,P.💧,P.💧,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 3, "3 x water correctly discounted")
    }
    
    func testMorePapersThanWaters(){
        waterApplies()
        var list =  [P.📰,P.📰,P.📰,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 2, "2 x water correctly discounted")
        
        list = [P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 1, "1 x water correctly discounted")
    }
    


}

import XCTest

class F_TriggerDiscountedByPercentageFurtherTests: XCTestCase {

    var offer : MilkOffer!
    
    override func setUp() {
        super.setUp()
        offer = MilkOffer()
        
    }
    
    override func tearDown() {
        offer = nil
        super.tearDown()
    }

    // MARK: Simple Trigger Offer
    func milkApplies(){
        let offer = MilkOffer()
        XCTAssertFalse(offer.applies(to: [P.smokedBacon]))
        XCTAssertFalse(offer.applies(to: [P.smokedBacon, P.smokedBacon])) //2 bacon
        XCTAssertFalse(offer.applies(to: [P.onePintMilk]))
        XCTAssertFalse(offer.applies(to: [P.onePintMilk,P.onePintMilk]))
        XCTAssertFalse(offer.applies(to: [P.twoPintMilk]))
        XCTAssertFalse(offer.applies(to: [P.twoPintMilk,P.twoPintMilk]))
        XCTAssertTrue(offer.applies(to: [P.onePintMilk,P.twoPintMilk]))
        XCTAssertTrue(offer.applies(to: [P.twoPintMilk,P.onePintMilk]))
    }
    
    
    func testMilkApplicable(){
        milkApplies()
    }
    
    func testPriceChange(){
        milkApplies()
        let milk = P.onePintMilk
        let milkOriginalPrice = milk.price //1 pint milk price = 45
        milk.price = 200
        let list = [milk,P.twoPintMilk]
        XCTAssertEqual(offer.discount(for:list), 40, "offer works with change in milk price")
        milk.price = milkOriginalPrice //needs to be put back as will persist for other tests
    }
    
    
    func testTwoMilksWithOne2Pint(){
        milkApplies()
        let list = [P.onePintMilk,P.twoPintMilk,P.onePintMilk]
        XCTAssertEqual(offer.discount(for:list), 9, "1 x 1 pint milk correctly discounted")
    }
    
    func testMoreMilksThan2Pint(){
        milkApplies()
        var list = [P.twoPintMilk,P.twoPintMilk,P.onePintMilk,P.onePintMilk,P.onePintMilk]
        XCTAssertEqual(offer.discount(for:list),18, "2 x milks correctly discounted")
        list = [P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.onePintMilk,P.onePintMilk,P.onePintMilk,P.onePintMilk,P.onePintMilk,P.onePintMilk]
        XCTAssertEqual(offer.discount(for:list),27, "3 x 1 pint milks correctly discounted")
    }
    
    func testMore2PintThanMilks(){
        milkApplies()
        var list =  [P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.onePintMilk,P.onePintMilk]
        XCTAssertEqual(offer.discount(for:list),18, "2 x 1 pint milks correctly discounted")
    
        list = [P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.twoPintMilk,P.onePintMilk]
        XCTAssertEqual(offer.discount(for:list),9, "1 x 1 pint milk correctly discounted")
    }
}



