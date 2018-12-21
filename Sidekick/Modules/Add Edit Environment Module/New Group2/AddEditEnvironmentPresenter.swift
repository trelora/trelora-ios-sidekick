import Foundation

class AddEditEnvironmentPresenter {
    // MARK: - VIPER Stack
    weak var interactor: AddEditEnvironmentPresenterToInteractorInterface!
    weak var view: AddEditEnvironmentPresenterToViewInterface!
    weak var wireframe: AddEditEnvironmentPresenterToWireframeInterface!
    
    // MARK: - Instance Variables
    weak var delegate: AddEditEnvironmentDelegate?
    var moduleWireframe: AddEditEnvironment {
        get {
            let mw = (self.wireframe as? AddEditEnvironment)!
            return mw
        }
    }
    
    // MARK: - Operational
    
}

// MARK: - Interactor to Presenter Interface
extension AddEditEnvironmentPresenter: AddEditEnvironmentInteractorToPresenterInterface {
    func didSave(newEnvironment environment: Environment) {
        delegate?.addEditDidSave(environment: environment)
    }
}

// MARK: - View to Presenter Interface
extension AddEditEnvironmentPresenter: AddEditEnvironmentViewToPresenterInterface {
    func addEnvironment(environment: Environment) {
        interactor.save(environment: environment)
    }
}

// MARK: - Wireframe to Presenter Interface
extension AddEditEnvironmentPresenter: AddEditEnvironmentWireframeToPresenterInterface {
    func set(delegate newDelegate: AddEditEnvironmentDelegate?) {
        delegate = newDelegate
    }
    
    func beginPresenting(withEnvironment environment: Environment?) {
        view.setupView(withEnvironment: environment)
    }
}

