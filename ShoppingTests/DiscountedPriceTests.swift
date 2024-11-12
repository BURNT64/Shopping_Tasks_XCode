import XCTest

class B_DiscountedPriceTests: XCTestCase {

    var offer : SeventyPercentOffOffer!
    
    override func setUp() {
        super.setUp()
        offer = SeventyPercentOffOffer()
        
    }
    
    override func tearDown() {
        
        offer = nil
        super.tearDown()
    }

    // MARK: DiscountedPrice Offer (70% discount)
    
    func SeventyPercentOffApplicable(){
        XCTAssertFalse(offer.applies(to: [P.coke]),"70% off offer not applicable to Coke")//1.75l Coca-Cola 200p
        XCTAssertFalse(offer.applies(to:[P.🍾]),"70% off offer not applicable to wine") // 499p)
        XCTAssertTrue(offer.applies(to:[P.🍪,P.coke]),"70% off offer applicable When cookie included in list") //Cookie and Coke
        XCTAssertTrue(offer.applies(to:[P.coke, P.🍪]),"70% off offer applicable when cookie is not first in the list") //Coke and Cookie
    }
    
    func testSeventyPercentOffApplicable(){
        SeventyPercentOffApplicable()
    }
    
    func testSeventyPercentOff(){
        SeventyPercentOffApplicable()
        XCTAssertEqual(offer.discount(for:[P.🍪]),343,"directly applied offer, 1 product")
        var list = [P.🍪] // 490p
        XCTAssertEqual(offer.discount(for:list),343, "second time (checks for ivar use")
        list.append(P.🍪) //  490p
        XCTAssertEqual(offer.discount(for:list),686, "70% discount applied (2 products)")
        list.append(P.🍪) //  490p
        XCTAssertEqual(offer.discount(for:list),1029, "70% discount applied (3 products)")
    }
    
    
    func testSeventyPercentSomeIneligibleProducts(){
        SeventyPercentOffApplicable()
        let list = [P.🍪, P.chicken, P.🍞] // 490p, 450p, 100
        XCTAssertEqual(offer.discount(for:list),343, "70% discount applied only to eligible products")
    }

}
