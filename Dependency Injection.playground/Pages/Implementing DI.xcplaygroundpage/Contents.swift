//: [Previous](@previous)

import Foundation

//: Primero definiremos unas dependencias que podremos utilizar para los 4 metodos.
//: Para facilitar el ejemplo no utilizaremos el principio de inversion de dependencias. Pero ustedes si usenlo.

//: On Demand:
let remoteAPI = MyRemoteAPI()
let repository = MyRepository(remoteAPI: remoteAPI)
let viewModel = ViewModel(repository: repository)
viewModel.doSomething()

//: Factory:
class DependencyFactory {
    //: Podemos observar que regresamos el protocolo y no una implementacion de este. Esto nos ayuda a aplicar substituciones facilmente.
    func makeRemoteAPI() -> RemoteAPI {
        return MyRemoteAPI()
    }
    func makeRepository() -> Repository {
        //: Si nuestra dependencia necesita otra dependencia podemos utilizar otro factory method para esto.
        return MyRepository(remoteAPI: makeRemoteAPI())
    }
    func makeViewModel() -> ViewModel {
        return ViewModel(repository: makeRepository())
    }
}

let dependencyFactory = DependencyFactory()
let viewModelFromFactory = dependencyFactory.makeViewModel()
viewModel.doSomething()

//: Nos ayudaria tener todos los `factory methods` estaticos para no tener que crear una instancia del factory. Al mantenerlos asi de cierta manera nos preparamos para el siguiente metodo.


//: Single Dependency Container
public class DependencyContainer {
    // MARK: Long lived dependencies
    private let repository: Repository
    
    init() {
        func makeRemoteAPI() -> RemoteAPI {
            return MyRemoteAPI()
        }
        func makeRepository() -> Repository {
            return MyRepository(remoteAPI: makeRemoteAPI())
        }
        
        self.repository = makeRepository()
    }
    
    public func makeViewModel() -> ViewModel {
        return ViewModel(repository: repository)
    }
}

let dependencyContainer = DependencyContainer()
let viewModelFromContainer = dependencyContainer.makeViewModel()


//: [Next](@next)
