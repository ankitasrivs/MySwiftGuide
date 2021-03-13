import UIKit
import Combine
var subscriptions = Set<AnyCancellable>()


///Operators:This are used to perform some operations on values that are published






///1.Map:Works in same way like higher order map in swift.We can use it transform our values

[1,2,3,4].publisher
    .map{
        $0 * 2
    }
    .sink(receiveValue: {
        print($0)
    })
    .store(in: &subscriptions)









//2.ReplaceNil(with:):::It is used to replace nil with somethng in output

[1,2,nil,4].publisher
    .replaceNil(with: 0)
    .sink(receiveValue: {
        print("Replace nil with output is::\(String(describing: $0))")
    })
    .store(in: &subscriptions)






//replaceEmpty(with:):Use it replace any empty values used in publisher

let empty = Empty<String,Never>()
    .replaceEmpty(with: "Not empty")
    .sink(receiveValue: {
        print("Value for replcace with empty is ::\($0)")
    })



///Collect is used to collct values in an array

[1,2,3,4].publisher
    .collect()
    .sink(receiveValue: {
        print($0)
    })
    .store(in: &subscriptions)



//You can put max number of values you want to collect also
[1,2,3,4].publisher
    .collect(2)
    .sink(receiveValue: {
        print($0)
    })
    .store(in: &subscriptions)




