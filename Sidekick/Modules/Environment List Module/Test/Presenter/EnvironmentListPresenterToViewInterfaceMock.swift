import Foundation
@testable import Sidekick

class EnvironmentListPresenterToViewInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
}

extension EnvironmentListPresenterToViewInterfaceMock: EnvironmentListPresenterToViewInterface {
    func setupView(withEnvironments environments: [Environment]) {
        functionsCalled.append(#function)
    }
    
    func deleteEnvironment(fromIndexPaths indexPaths: [IndexPath]) {
        functionsCalled.append(#function)
    }
    

}
