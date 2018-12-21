import UIKit

class EnvironmentListWireframe {
    // MARK: - VIPER Stack
    lazy var moduleInteractor = EnvironmentListInteractor()
    // Uncomment to use a navigationController from storyboard
    
    lazy var moduleNavigationController: UINavigationController = {
        let sb = EnvironmentListWireframe.storyboard()
        let nc = (sb.instantiateViewController(withIdentifier: EnvironmentListConstants.navigationControllerIdentifier) as? UINavigationController)!
        return nc
    }()
    
    lazy var modulePresenter = EnvironmentListPresenter()
    lazy var moduleView: EnvironmentListView = {
        // Uncomment the commented line below and delete the storyboard
        //      instantiation to use a navigationController from storyboard
        let vc = self.moduleNavigationController.viewControllers[0] as! EnvironmentListView
        _ = vc.view
        return vc
    }()
    
    // MARK: - Computed VIPER Variables
    lazy var presenter: EnvironmentListWireframeToPresenterInterface = self.modulePresenter
    lazy var view: EnvironmentListNavigationInterface = self.moduleView
    
    // MARK: - Instance Variables
    lazy var addEditEnvironmentWireframe: AddEditEnvironmentWireframe = AddEditEnvironmentWireframe()
    
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
        return UIStoryboard(name: EnvironmentListConstants.storyboardIdentifier,
                            bundle: Bundle(for: EnvironmentListWireframe.self))
    }
    
    // MARK: - Operational
    
}

// MARK: - Module Interface
extension EnvironmentListWireframe: EnvironmentList {
    var delegate: EnvironmentListDelegate? {
        get {
            return presenter.delegate
        }
        set {
            presenter.set(delegate: newValue)
        }
    }
    
    func presentViewController(fromWindow window: UIWindow) {
        window.rootViewController = moduleNavigationController
        presenter.beginPresenting()
    }
}

// MARK: - Presenter to Wireframe Interface
extension EnvironmentListWireframe: EnvironmentListPresenterToWireframeInterface {
    
    func presentAddEditVC(withEnvironment environment: Environment?) {
        addEditEnvironmentWireframe.presentViewController(fromViewController: moduleView, withEnvironment: environment)
    }
    
}
