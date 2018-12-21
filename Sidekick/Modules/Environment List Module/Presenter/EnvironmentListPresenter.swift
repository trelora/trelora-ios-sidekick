import Foundation

class EnvironmentListPresenter {
    // MARK: - VIPER Stack
    weak var interactor: EnvironmentListPresenterToInteractorInterface!
    weak var view: EnvironmentListPresenterToViewInterface!
    weak var wireframe: EnvironmentListPresenterToWireframeInterface!
    
    // MARK: - Instance Variables
    weak var delegate: EnvironmentListDelegate?
    var moduleWireframe: EnvironmentList {
        get {
            let mw = (self.wireframe as? EnvironmentList)!
            return mw
        }
    }
    
    // MARK: - Operational
    
}

// MARK: - Interactor to Presenter Interface
extension EnvironmentListPresenter: EnvironmentListInteractorToPresenterInterface {
    func listOfAllEnvironments(environments: [Environment]) {
        view.setupView(withEnvironments: environments)
    }
    
    func successfullyDeletedEnvironment(atIndexPaths indexPaths: [IndexPath]) {
        view.deleteEnvironment(fromIndexPaths: indexPaths)
    }
}

// MARK: - View to Presenter Interface
extension EnvironmentListPresenter: EnvironmentListViewToPresenterInterface {
    func addButtonPressed() {
        wireframe.presentAddEditVC(withEnvironment: nil)
    }
    
    func edit(environment: Environment) {
        wireframe.presentAddEditVC(withEnvironment: environment)
    }
    
    func deleteButtonPressed(forIndex index: Int) {
        interactor.deleteEnvironment(atIndex: index)
    }
}

// MARK: - Wireframe to Presenter Interface
extension EnvironmentListPresenter: EnvironmentListWireframeToPresenterInterface {
    func set(delegate newDelegate: EnvironmentListDelegate?) {
        delegate = newDelegate
    }
    
    func beginPresenting() {
        interactor.grabAllEnvironments()
    }
}

