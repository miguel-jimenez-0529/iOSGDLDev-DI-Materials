import UIKit

//: Definiremos una dependencia que deseamos utilizar
class MyDependency {
    func doSomeWork() {}
}

let dependecy = MyDependency()

//: Inyectando dependencia atravez del constructor
class MyObjectUnderConstruction1 {
    
    private let myDependecy: MyDependency
    
    init(myDependency: MyDependency) {
        self.myDependecy = myDependency
    }
}
let obj1 = MyObjectUnderConstruction1(myDependency: dependecy)
//: Inyectando dependencia a una variable de la clase
class MyObjectUnderConstruction2 {
    
    var myDependency: MyDependency!
}

let obj2 = MyObjectUnderConstruction2()
obj2.myDependency = dependecy

//: Inyectando dependencia atravez de una funcion de la clase
class MyObjectUnderConstruction3 {
    private var myDependency: MyDependency!
    func set(myDependency: MyDependency) {
        self.myDependency = myDependency
    }
}
let obj3 = MyObjectUnderConstruction3()
obj3.set(myDependency: dependecy)

