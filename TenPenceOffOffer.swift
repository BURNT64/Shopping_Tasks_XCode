/**Example class to enable testing of discount method
 */
class TenPenceOffOffer : MoneyOffOffer {
    
    var discount = 10
    var name: String
    
    init(){
        name = "10p off your shopping"
    }
    
    //Functions commented out using command /, use the same commend to uncomment.
    //These functions operate under the extention MoneyOffOffer in ProtocolExtentions.
    
//    func applies(to list: [Product]) -> Bool {
//        return !list.isEmpty //must actually buy something to get discount, assumes no free products!
//    }
//    
//    func discount(for list: [Product]) -> Int {
//        var sum = 0
//        for item in list {
//            sum += item.price
//            if sum >= 10 {
//                return 10
//            }
//        }
//        return sum
//    }
}
