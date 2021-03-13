import UIKit

 class Model{
    @Published  var name = ""
    @Published  var age = 0
}

class NewDemo{
var mod = Model()
    init() {
     initializeValues()
     checkForData()
    }
    
    /// Method will be called to check for
    func checkForData(){
        mod.$name.sink{
            print($0)
        }
        mod.$age.sink{
            print($0)
        }
    }
    
    /// Method will initialize value
    func initializeValues(){
        mod.age = 20
        mod.name = "My name is aria"
    }
}
var newDe = NewDemo()
