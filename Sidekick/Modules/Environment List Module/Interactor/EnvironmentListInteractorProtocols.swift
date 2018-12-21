// VIPER Interface for communication from Presenter to Interactor
protocol EnvironmentListPresenterToInteractorInterface: class {
    func grabAllEnvironments()
    func deleteEnvironment(atIndex index: Int)
}
