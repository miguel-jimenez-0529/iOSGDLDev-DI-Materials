import Foundation

public protocol Repository:  RemoteAPI {}

public class MyRepository: Repository {
    
    private let remoteAPI: RemoteAPI
    
    public init(remoteAPI: RemoteAPI) {
        self.remoteAPI = remoteAPI
    }
    
    public func loginUser(email: String, password: String) {
        
    }
}
