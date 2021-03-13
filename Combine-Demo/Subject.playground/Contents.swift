import UIKit
import Combine
var subscription = Set<AnyCancellable>()


//Subject acts as a bridge between subscriber and publisher.We can use it to send values to non combine code
//Passthrough subjects sends multiple value based on demand. They will  send values and completion event.
//You can pass error enum as per requirement in place of never
let subject = PassthroughSubject<Int,Never>()

let _ = subject
  .sink(
    receiveCompletion: { completion in
      print("completion is :::", completion)
    },
    receiveValue: { value in
      print("sink value is ::", value)
    }
  )
    .store(in: &subscription)


subject.send(1)
subject.send(3)
subject.send(5)
subject.send(7)
subject.send(completion: .finished)

//CurrentValueSubject:This can be used to send current value to the subscriber
let subjectCurrent = CurrentValueSubject<String,Never>("")
subjectCurrent
   .sink(receiveValue: { print("new value::\($0)") })
   .store(in: &subscription) // 4
subjectCurrent.send("d")
print(subjectCurrent.value)
