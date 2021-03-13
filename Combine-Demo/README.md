# Combine Basics

This branch contents Swift Combine definitions with examples

/Publishers:::::


//These publisher can emit single/multiple inputs to the subscriber



///Simple Example for publisher local


let publisherLocal = (1...6).publisher

let subscriber = publisherLocal.sink{ value in
    
    print(value)
    
}

//Result
//1
//2
//3
//4
//5
//6


//Example of just in Publisher.It send only one value and then stops


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





let justPublis = Just(1)


let subscriberJust2 = justPublis.sink { (value) in
    print("completion is ::\(value)")
} receiveValue: { (value) in
    print("just value is::\(value)")
}

///Use of assign:we can assign to a variable by using assign property


class NewClass {
    var intValue: Int = 0 {
    didSet {
      print("Int value assigned is::\(intValue)")
    }
  }
}

let obj = NewClass()

_ = publisherLocal.assign(to: \.intValue, on: obj)

