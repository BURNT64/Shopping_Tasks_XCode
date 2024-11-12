import XCTest

class D_ComplexSelectionTests: XCTestCase {
    
    var offer : WinterWarmerOffer!
    
    override func setUp() {
        super.setUp()
        offer = WinterWarmerOffer()
    }
    
    override func tearDown() {
        offer = nil
        super.tearDown()
    }
    
    func offerApplies(){
        
        let notEnoughPizzas = [P.meatPizza, P.🍪, P.doughBalls, P.doughBalls, P.garlicBread]
        XCTAssertFalse(offer.applies(to: notEnoughPizzas))
        
        var items = [P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread]
        XCTAssertFalse(offer.applies(to: items))
        
        items.append(P.🍪)
        XCTAssertTrue(offer.applies(to: items))
        
        items.append(contentsOf: [P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪])
        
        XCTAssertTrue(offer.applies(to: items))
    }
    
    func testOfferApplies() {
        offerApplies()
    }
    
    func testdiscountOneInstanceOfOffer(){
        offerApplies()
        //1849 + 1799 + 499 + 499 + 400 + 490 = 5536 so discount 3437
        var items = [P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪]
        XCTAssertEqual(offer.discount(for:items), 3437)
        
        items.append(contentsOf: [P.veggiePizza, P.veggiePizza, P.doughBalls, P.doughBalls])//extra pizza and sides,
        XCTAssertEqual(offer.discount(for:items), 3437)
    }
    
    
    
    func testdiscountTwoInstancesOfOffer(){
        offerApplies()
        //1849 + 1799 + 499 + 499 + 400 + 490 = 5536 so discount 3437 (twice)
        var items = [P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪, P.meatPizza, P.veggiePizza, P.doughBalls, P.doughBalls, P.garlicBread, P.🍪]
        XCTAssertEqual(offer.discount(for:items), 6874)
        
        //add meat pizza (cheapest veg disregarded, so discount raised by 50p)
        items.append(P.meatPizza)
        XCTAssertEqual(offer.discount(for:items), 6924)
    }
    

    
}

class J_ComplexSelectionTests: XCTestCase {
    
    var offer : LaundryProductsOffer!
    
    override func setUp() {
        super.setUp()
        offer = LaundryProductsOffer()
    }
    
    override func tearDown() {
        offer = nil
        super.tearDown()
    }
    
    func offerApplies(){
        
        let notEnoughDetergents = [P.persil, P.comfortSoftener, P.genericSoftener, P.premiumSoftener]
        XCTAssertFalse(offer.applies(to: notEnoughDetergents))
        
        var items = [P.persil, P.ariel, P.genericSoftener]
        XCTAssertFalse(offer.applies(to: items))
        
        items.append(P.comfortSoftener)
        XCTAssertTrue(offer.applies(to: items))
        
        items.append(contentsOf: [P.persil, P.ariel, P.genericSoftener, P.premiumSoftener, P.comfortSoftener])
        
        XCTAssertTrue(offer.applies(to: items))
    }
    
    func testOfferApplies() {
        offerApplies()
    }
    
    func testdiscountOneInstanceOffer(){
        offerApplies()
        //999 + 699 + 429 + 399 = 2526 so discount 427
        var items = [P.persil, P.ariel, P.comfortSoftener, P.genericSoftener]
        XCTAssertEqual(offer.discount(for:items), 427)
        
        items.append(contentsOf: [P.persil, P.ariel, P.comfortSoftener, P.doughBalls, P.twoPintMilk])//extra detergens, conditioner and unrelated items
        XCTAssertEqual(offer.discount(for:items), 727)
        
        //999 + 699 + 429 + 1200 = 3327 so discount 1228
        items = [P.persil, P.ariel, P.comfortSoftener, P.premiumSoftener]
        XCTAssertEqual(offer.discount(for:items), 1228)
        
        items.append(contentsOf: [P.persil, P.ariel, P.comfortSoftener, P.doughBalls, P.twoPintMilk])//extra detergens, conditioner and unrelated items
        XCTAssertEqual(offer.discount(for:items), 1528)
    }
    
    
    
    func testdiscountTwoInstancesOffer(){
        offerApplies()
        //999 + 699 + 429 + 399 = 2526 so discount 427 (twice now)
        var items = [P.persil, P.ariel, P.comfortSoftener, P.genericSoftener, P.persil, P.ariel, P.comfortSoftener, P.genericSoftener]
        XCTAssertEqual(offer.discount(for:items), 854)
        
        //add premium softener (cheapest generic softener disregarded, so discount raised by 801p)
        items.append(P.premiumSoftener)
        XCTAssertEqual(offer.discount(for:items), 1655)
    }
    

    
}


