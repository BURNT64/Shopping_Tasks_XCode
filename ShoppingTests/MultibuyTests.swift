import XCTest
class C_MultiBuyTests : XCTestCase {
    var offer : BuyTwoGetThirdFreeOffer!
    
    override func setUp() {
        super.setUp()
        offer = BuyTwoGetThirdFreeOffer()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        offer = nil
        super.tearDown()
    }
    
    // MARK: Multibuy offer (Wine)
    func wineApplies(){
        let offer = BuyTwoGetThirdFreeOffer()
        var list = [P.🍷]
        XCTAssertFalse(offer.applies(to: list),"not enough products, not enough wine")
        
        list.append(P.💧)
        XCTAssertFalse(offer.applies(to: list),"not enough products, not enough wine")
        
        list.append(P.🍾)
        XCTAssertFalse(offer.applies(to: list),"enough products, not enough wine")
        
        list.append(P.🍷) //wine (total of 3)
        XCTAssertTrue(offer.applies(to: list),"enough wine")
    }
    
    func testBuyTwoGetThirdFreeApplies(){
       wineApplies()
    }
    
    func testBuyTwoGetThirdFree4Items(){
       wineApplies()
        var list = [P.🍷, P.🍷, P.🍾, P.🍾] //(Sauvignon Blanc 75cl 499, Cabernet Sauvignon 75cl 299)
        XCTAssertEqual(offer.discount(for:list),299,"discount is value of every third item bought when the list is sorted in price order");
        
        list = [ P.🍾, P.🍾, P.🍷, P.🍷] //reordered
        XCTAssertEqual(offer.discount(for:list),299,"above, reordered");
    }
    
    
    func testBuyTwoGetThirdFree5Items(){
        wineApplies()
        var list = [P.🍾, P.🍾, P.🍷, P.🍷,P.🍷 ]
        XCTAssertEqual(offer.discount(for:list),299,"Buy two get third free correct with 5 items");
        list = [P.🍾, P.🍾, P.🍾,P.🍷, P.🍷]
        XCTAssertEqual(offer.discount(for:list),499,"Buy two get third free correct with 5 items");
    }
    
    func testBuyTwoGetThirdFree6Items(){
        wineApplies()
        var list = [P.🍷, P.🍷,P.🍷,P.🍾, P.🍾, P.🍾]
        XCTAssertEqual(offer.discount(for:list),798,"One of each price discounted");
        list = [P.🍾, P.🍾, P.🍷,P.🍷, P.🍷,P.🍷]
        XCTAssertEqual(offer.discount(for:list),598,"Two cheaper items discounted");
    }
 
}
