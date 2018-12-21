import UIKit

class EnvironmentListView: UIViewController {
    // MARK: - VIPER Stack
    weak var presenter: EnvironmentListViewToPresenterInterface!
    
    // MARK: - Instance Variables
    
    let cellIdentifier = "EnvironmentTableViewCell"
    var environments: [Environment] = []
    var selectedIndexPath: IndexPath = IndexPath(row: 0, section: 0)

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Operational
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        highlightCurrentEnvironment()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.allowsSelectionDuringEditing = true
        tableView.tableFooterView = UIView()
    }
    
    func highlightCurrentEnvironment() {
        
        environments.enumerated().forEach { [weak self] (index, environment) in
            guard let weakself = self else { return }
            if GroupDefaultsManager.shared.getAPIHost() == environment.apiHost {
                weakself.selectedIndexPath = IndexPath(row: index, section: 0)
            }
        }
        
        tableView.selectRow(at: selectedIndexPath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        presenter.addButtonPressed()
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        sender.title = tableView.isEditing ? "Done" : "Edit"
    }
}

// MARK: - Navigation Interface
extension EnvironmentListView: EnvironmentListNavigationInterface { }

// MARK: - Presenter to View Interface
extension EnvironmentListView: EnvironmentListPresenterToViewInterface {
    
    func setupView(withEnvironments environments: [Environment]) {
        self.environments = environments
        tableView.reloadData()
    }
    
    func deleteEnvironment(fromIndexPaths indexPaths: [IndexPath]) {
        indexPaths.forEach({ environments.remove(at: $0.row) })
        tableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.left)
    }
    
}

// MARK: - Table View Data Source

extension EnvironmentListView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return environments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EnvironmentTableViewCell
        let environment = environments[indexPath.row]
        cell.setupView(withEnvironment: environment)
        return cell
    }
    
}

// MARK: - Table View Delegate

extension EnvironmentListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let environment = environments[indexPath.row]
        if tableView.isEditing {
            presenter.edit(environment: environment)
        } else {
            GroupDefaultsManager.shared.setEnvironment(withEnvironment: environment)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row > 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            presenter.deleteButtonPressed(forIndex: indexPath.row)
        }
    }
    
}

// MARK: - Add Edit Environment Delegate

extension EnvironmentListView: AddEditEnvironmentDelegate {
    
    func addEditDidSave(environment: Environment) {
        environments = GroupDefaultsManager.shared.environments
        tableView.reloadData()
    }
    
}

