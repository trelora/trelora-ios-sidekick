// VIPER Interface for manipulating the navigation of the view
protocol AddEditEnvironmentNavigationInterface: class {

}

// VIPER Interface for communication from Presenter -> View
protocol AddEditEnvironmentPresenterToViewInterface: class {
    func setupView(withEnvironment environment: Environment?)
}
