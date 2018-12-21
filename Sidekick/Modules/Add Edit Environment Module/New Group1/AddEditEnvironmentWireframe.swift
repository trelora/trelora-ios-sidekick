import UIKit

class AddEditEnvironmentWireframe {
    // MARK: - VIPER Stack
    lazy var moduleInteractor = AddEditEnvironmentInteractor()
    // Uncomment to use a navigationController from storyboard
    
     lazy var moduleNavigationController: UINavigationController = {
     let sb = AddEditEnvironmentWireframe.storyboard()
     let nc = (sb.instantiateViewController(withIdentifier: AddEditEnvironmentConstants.navigationControllerIdentifier) as? UINavigationController)!
     return nc
     }()
 
    lazy var modulePresenter = AddEditEnvironmentPresenter()
    lazy var moduleView: AddEditEnvironmentView = {
        // Uncomment the commented line below and delete the storyboard
        //      instantiation to use a navigationController from storyboard
        let vc = self.moduleNavigationController.viewControllers[0] as! AddEditEnvironmentView
        _ = vc.view
        return vc
    }()
    
    // MARK: - Computed VIPER Variables
    lazy var presenter: AddEditEnvironmentWireframeToPresenterInterface = self.modulePresenter
    lazy var view: AddEditEnvironmentNavigationInterface = self.moduleView
    
    // MARK: - Instance Variables
    
    // MARK: - Initialization
    init() {
        let i = moduleInteractor
        let p = modulePresenter
        let v = moduleView
        
        i.presenter = p
        
        p.interactor = i
        p.view = v
        p.wireframe = self
        
        v.presenter = p
    }
    
    class func storyboard() -> UIStoryboard {
        return UIStoryboard(name: AddEditEnvironmentConstants.storyboardIdentifier,
                            bundle: Bundle(for: AddEditEnvironmentWireframe.self))
    }
    
    // MARK: - Operational
    
}

// MARK: - Module Interface
extension AddEditEnvironmentWireframe: AddEditEnvironment {
    var delegate: AddEditEnvironmentDelegate? {
        get {
            return presenter.delegate
        }
        set {
            presenter.set(delegate: newValue)
        }
    }
    
    func presentViewController(fromViewController viewController: UIViewController,
                               withEnvironment environment: Environment?) {
        viewController.present(moduleNavigationController, animated: true, completion: nil)
        presenter.set(delegate: viewController as? AddEditEnvironmentDelegate)
        presenter.beginPresenting(withEnvironment: environment)
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension AddEditEnvironmentWireframe: AddEditEnvironmentPresenterToWireframeInterface {
}

