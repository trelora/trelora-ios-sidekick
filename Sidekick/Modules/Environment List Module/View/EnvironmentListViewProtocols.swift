import UIKit

// VIPER Interface for manipulating the navigation of the view
protocol EnvironmentListNavigationInterface: class {

}

// VIPER Interface for communication from Presenter -> View
protocol EnvironmentListPresenterToViewInterface: class {
    func setupView(withEnvironments environments: [Environment])
    func deleteEnvironment(fromIndexPaths indexPaths: [IndexPath])
}
