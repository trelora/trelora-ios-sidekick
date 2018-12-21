// VIPER Interface to the Module
protocol AddEditEnvironmentDelegate: class {
    func addEditDidSave(environment: Environment)
}

// VIPER Interface for communication from Interactor -> Presenter
protocol AddEditEnvironmentInteractorToPresenterInterface: class {
    func didSave(newEnvironment environment: Environment)
}

// VIPER Interface for communication from View -> Presenter
protocol AddEditEnvironmentViewToPresenterInterface: class {
    func addEnvironment(environment: Environment)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol AddEditEnvironmentWireframeToPresenterInterface: class {
    weak var delegate: AddEditEnvironmentDelegate? { get }
    func set(delegate newDelegate: AddEditEnvironmentDelegate?)
    func beginPresenting(withEnvironment environment: Environment?)
}

