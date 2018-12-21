import UIKit
@testable import Sidekick

class EnvironmentListWireframeInterfacesMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
}

extension EnvironmentListWireframeInterfacesMock: EnvironmentList {
    func presentViewController(fromWindow window: UIWindow) {
        
    }
    
        var delegate: EnvironmentListDelegate? {
                get {
                        functionsCalled.append(#function)
                        return nil
                }
            set {
                functionsCalled.append(#function)
            }
        }
}

extension EnvironmentListWireframeInterfacesMock: EnvironmentListPresenterToWireframeInterface {
    func presentAddEditVC(withEnvironment environment: Environment?) {
        
    }

}
