import UIKit

// VIPER Module Constants
struct AddEditEnvironmentConstants {
    // Uncomment to utilize a navigation contoller from storyboard
    static let navigationControllerIdentifier = "AddEditEnvironmentNavigationController"
    static let storyboardIdentifier = "AddEditEnvironment"
    static let viewIdentifier = "AddEditEnvironmentView"
}

// Interface Abstraction for working with the VIPER Module
protocol AddEditEnvironment: class {
    var delegate: AddEditEnvironmentDelegate? { get set }
    func presentViewController(fromViewController viewController: UIViewController, withEnvironment environment: Environment?)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol AddEditEnvironmentPresenterToWireframeInterface: class {
    
}

