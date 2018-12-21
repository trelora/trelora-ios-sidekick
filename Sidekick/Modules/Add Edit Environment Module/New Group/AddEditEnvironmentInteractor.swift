import Foundation

class AddEditEnvironmentInteractor {
        // MARK: - VIPER Stack
        weak var presenter: AddEditEnvironmentInteractorToPresenterInterface!

        // MARK: - Instance Variables

        // MARK: - Operational

}

// MARK: - Presenter To Interactor Interface
extension AddEditEnvironmentInteractor: AddEditEnvironmentPresenterToInteractorInterface {
    func save(environment: Environment) {
        GroupDefaultsManager.shared.add(environment: environment)
        presenter.didSave(newEnvironment: environment)
    }
}
