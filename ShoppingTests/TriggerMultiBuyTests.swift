
import XCTest

class TriggerMultiBuyTests: XCTestCase {

    var offer : FreeSauceWithMeatOffer!
    var list = [Product]()
    override func setUp()  {
        super.setUp()
        offer = FreeSauceWithMeatOffer()
        
    }

    override func tearDown() {
        
        offer = nil
        super.tearDown()
    }

    
    
    
    
    func testApplicable() throws {
           XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.coke, P.comfortSoftener, P.🍪, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to wrong items
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply if no sauce purchased
        
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke, P.ketchup, P.mayo]
        XCTAssertTrue(offer.applies(to: list)) //should apply
        
    }
    
    func testDiscount() throws {
        
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.coke, P.comfortSoftener, P.🍪, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertEqual(0, offer.discount(for: list))// shouldnt apply to wrong items
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke]
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply if only meat purchased
        
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke, P.ketchup, P.mayo]
        XCTAssertEqual(248, offer.discount(for: list))
        
       
    }


}



import XCTest

class TriggerMultiBuyFurtherTests: XCTestCase {

    var offer : FreeCokeZeroWith2OtherCokesOffer!
    var list = [Product]()
    override func setUp()  {
        super.setUp()
        offer = FreeCokeZeroWith2OtherCokesOffer()
        
    }

    override func tearDown() {
        
        offer = nil
        super.tearDown()
    }

    
    func testApplicable() throws {
           XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.mushrooms, P.comfortSoftener, P.🍪, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to wrong items
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.mushrooms]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply if no coke purchased
        
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke, P.coke, P.ketchup, P.cokezero]
        XCTAssertTrue(offer.applies(to: list)) //should apply
        
    }
    
    func testDiscount() throws {
        
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.mushrooms, P.comfortSoftener, P.🍪, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertEqual(0, offer.discount(for: list))// shouldnt apply to wrong items
        
        list = [P.coke, P.dietcoke, P.dietcoke, P.coke, P.coke]
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply if only other cokes priced at 200 each are purchased.
        
        
        list = [P.coke, P.dietcoke, P.dietcoke, P.coke, P.coke, P.cokezero, P.cokezero]
        XCTAssertEqual(240, offer.discount(for: list))
        
        list.append(P.cokezero)
        XCTAssertEqual(240, offer.discount(for: list)) //Only apply for instances of purchase of two cokes priced at 200 each
    
    }
}
