import Foundation
@testable import Sidekick

class EnvironmentListInteractorToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
}

extension EnvironmentListInteractorToPresenterInterfaceMock: EnvironmentListInteractorToPresenterInterface {
    func listOfAllEnvironments(environments: [Environment]) {
        
    }
    
    func successfullyDeletedEnvironment(atIndexPaths indexPaths: [IndexPath]) {
        
    }
}
