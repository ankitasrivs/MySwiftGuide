import UIKit
import Combine
var str = "A"
let publisher = ["A","B","C","D","E"].publisher

var subscriptions  = Set<AnyCancellable>()
//Future:It is a publisher that is mostly use to publish one value on future and finish.We use promise case for success

let future  = Future<String,Never>{promise in
    DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
        promise(.success(str + "yo"))
    }
    
}

//Subscription are used to store any subscription the publisher.Below code will not work if you remove subscription
future.sink(receiveCompletion: { print("Second", $0) },
        receiveValue: { print("Second", $0) })
    .store(in: &subscriptions)

