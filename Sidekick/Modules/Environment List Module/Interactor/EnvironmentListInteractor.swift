import UIKit

class EnvironmentListInteractor {
    // MARK: - VIPER Stack
    weak var presenter: EnvironmentListInteractorToPresenterInterface!
    
    // MARK: - Instance Variables

    // MARK: - Operational
    
}

// MARK: - Presenter To Interactor Interface
extension EnvironmentListInteractor: EnvironmentListPresenterToInteractorInterface {
    func grabAllEnvironments() {
        presenter.listOfAllEnvironments(environments: GroupDefaultsManager.shared.environments)
    }
    
    func deleteEnvironment(atIndex index: Int) {
        GroupDefaultsManager.shared.remove(environmentAtIndex: index)
        presenter.successfullyDeletedEnvironment(atIndexPaths: [IndexPath(row: index, section: 0)])
    }
}

