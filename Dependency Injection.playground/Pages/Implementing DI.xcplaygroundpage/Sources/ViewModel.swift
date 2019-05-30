import Foundation

public class ViewModel {
    private let repository: Repository
    public init(repository: Repository) {
        self.repository = repository
    }
    
    public func doSomething() {
        repository.loginUser(email: "iosDevelopers", password: "burrito123")
    }
}
