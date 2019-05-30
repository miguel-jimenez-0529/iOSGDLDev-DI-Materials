import Foundation

public protocol RemoteAPI {
    func loginUser(email: String, password: String)
}

public class MyRemoteAPI: RemoteAPI {
    
    public init() {}
    
    public func loginUser(email: String, password: String) {
        
    }
}
