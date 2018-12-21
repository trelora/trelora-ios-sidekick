import UIKit

// VIPER Interface to the Module
protocol EnvironmentListDelegate: class {
    
}

// VIPER Interface for communication from Interactor -> Presenter
protocol EnvironmentListInteractorToPresenterInterface: class {
    func listOfAllEnvironments(environments: [Environment])
    func successfullyDeletedEnvironment(atIndexPaths indexPaths: [IndexPath])
}

// VIPER Interface for communication from View -> Presenter
protocol EnvironmentListViewToPresenterInterface: class {
    func addButtonPressed()
    func edit(environment: Environment)
    func deleteButtonPressed(forIndex index: Int)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol EnvironmentListWireframeToPresenterInterface: class {
    weak var delegate: EnvironmentListDelegate? { get }
    func set(delegate newDelegate: EnvironmentListDelegate?)
    func beginPresenting()
}

