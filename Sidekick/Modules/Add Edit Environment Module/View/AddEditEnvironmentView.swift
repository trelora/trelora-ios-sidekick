import UIKit

class AddEditEnvironmentView: UIViewController {
    // MARK: - VIPER Stack
    weak var presenter: AddEditEnvironmentViewToPresenterInterface!
    
    // MARK: - Instance Variabvar
    
    var environment: Environment?
    var delegate: AddEditEnvironmentDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var apiURLTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    // MARK: - Operational
    
    func setupViewForEditMode(environment: Environment) {
        nameTextField.text = environment.name
        apiURLTextField.text = environment.apiHost
        urlTextField.text = environment.webHost
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let apiString = apiURLTextField.text else { return }
        guard let urlString = urlTextField.text else { return }
        createEnvironment(name: name, apiString: apiString, urlString: urlString)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func createEnvironment(name: String, apiString: String, urlString: String) {
        
        if var existingEnvironment = environment {
            existingEnvironment.name = name
            existingEnvironment.apiHost = apiString
            existingEnvironment.webHost = urlString
        } else {
            let environment = Environment(name: name, apiHost: apiString, webHost: urlString)
            presenter.addEnvironment(environment: environment)
        }
        
    }
}

// MARK: - Navigation Interface
extension AddEditEnvironmentView: AddEditEnvironmentNavigationInterface { }

// MARK: - Presenter to View Interface
extension AddEditEnvironmentView: AddEditEnvironmentPresenterToViewInterface {
    
    func setupView(withEnvironment environment: Environment?) {
        self.environment = environment
        
        if let environment = environment {
            navigationItem.title = "Editing Environment"
            setupViewForEditMode(environment: environment)
        } else {
            navigationItem.title = "New Environment"
        }
    }
    
}

