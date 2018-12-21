import UIKit

// VIPER Module Constants
struct EnvironmentListConstants {
        // Uncomment to utilize a navigation contoller from storyboard
        static let navigationControllerIdentifier = "EnvironmentListNavigationController"
        static let storyboardIdentifier = "EnvironmentList"
        static let viewIdentifier = "EnvironmentListView"
}

// Interface Abstraction for working with the VIPER Module
protocol EnvironmentList: class {
        var delegate: EnvironmentListDelegate? { get set }
        func presentViewController(fromWindow window: UIWindow)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol EnvironmentListPresenterToWireframeInterface: class {
    func presentAddEditVC(withEnvironment environment: Environment?)
}
