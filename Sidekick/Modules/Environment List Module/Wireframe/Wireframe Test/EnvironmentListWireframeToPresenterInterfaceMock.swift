@testable import Sidekick

class EnvironmentListWireframeToPresenterInterfaceMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
    var modifiedDelegate: EnvironmentListDelegate?
    
    // MARK: - Output Variables
    var delegateToReturn: EnvironmentListDelegate?
}

extension EnvironmentListWireframeToPresenterInterfaceMock: EnvironmentListWireframeToPresenterInterface {
    
    func beginPresenting() {
        functionsCalled.append(#function)
    }
    
    weak var delegate: EnvironmentListDelegate? {
        get {
            functionsCalled.append(#function)
            return delegateToReturn
        }
    }
    
    func set(delegate newDelegate: EnvironmentListDelegate?) {
        functionsCalled.append(#function)
        modifiedDelegate = newDelegate
    }
}
