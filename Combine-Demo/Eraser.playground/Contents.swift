import UIKit
import Combine
var subscriptions = Set<AnyCancellable>()
//Eraser are to use hide additional details of publisher

let subject = PassthroughSubject<String,Never>()
let publisher = subject.eraseToAnyPublisher()
publisher
   .sink(receiveValue: { print($0) })
   .store(in: &subscriptions)
 
 // 4
 subject.send("Yo")
subject.send(completion: .finished)
//It will create error  as we are using eraser on publisher
//publisher.send("yes")
