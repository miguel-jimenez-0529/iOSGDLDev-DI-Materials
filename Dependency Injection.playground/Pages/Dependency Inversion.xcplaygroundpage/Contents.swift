

class SpecificReceiver {
    func receiveThis() {
        //Do some fun stuff
    }
}

class Sender {
    let receiver : SpecificReceiver
    
    init(receiver: SpecificReceiver) {
        self.receiver = receiver
    }
    
    func sendSomething() {
        receiver.receiveThis()
    }
}

let servise = SpecificReceiver()
let sender = Sender(receiver: servise)

/*:
 ![Image1](image1.png)
 
 
 Porque esto se puede mejorar?
 
 Si queremos cambiar `SpecificReceiver` tenemos que cambiar tambien `Sender`.
 
 O si nos aplican un `Parse` tenemos que cambiar todas nuestras classes que utilizen `SpecificReceiver`
 
 */

protocol Receiver {
    func receiveThis()
}

extension SpecificReceiver: Receiver {}

class Sender2 {
    let receiver : Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func sendSomething() {
        receiver.receiveThis()
    }
}

let specificReceiver = SpecificReceiver()
let sender2 = Sender2(receiver: specificReceiver)

/*:
 
  Cuando invertimos la dependencia y ahora la flecha va hacia arriba, `Sender2` ya no depende de una implementacion fija de `Receiver`, ahora depende de una Abstraccion
 
 
 ![Image1](image2.png)
 

 
  Ahora podemos cambiar la implementacion por `AnotherReceiver` siempre y cuando ambos conformen el protocolo. De esta manera la logica de `Sender2` puede ser reutilizada.
 
  ![Image4](image4.png)
 
 
 
 */

class FireBaseReceiver: Receiver {
    func receiveThis() {
        // Do something else
    }
}

let newReceiver = FireBaseReceiver()
let newSender = Sender2(receiver: specificReceiver)

/*:
 Estos son unos grandes beneficios que nos da el principio de Inversion de Dependencias. Cuando las dependencias estan aisladas por el uso de un protocolo, hacer cambios se combierte en cambiar plugins. Es como LEGO
 
 
 Que otros beneficios podemos obter del Principio de Inverision de Dependencias?
 
 Ya que tenemos todo modularizado, sin problemas podemos crear un `TestReceiver` que nos ayude a poder testear la logica de `Sender2` ya que esta implementacion la controlaremos nosotros.
 */

import XCTest

class TestsReceiver: Receiver {
    var receivedThisCalled = false
    func receiveThis() {
        receivedThisCalled = true
    }
}

let testReceiver = TestsReceiver()
let testSender = Sender2(receiver: testReceiver)
testSender.sendSomething()
XCTAssert(testReceiver.receivedThisCalled)
