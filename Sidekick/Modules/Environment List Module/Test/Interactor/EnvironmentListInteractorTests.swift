import Foundation
import XCTest

@testable import Sidekick

class EnvironmentListInteractorTests: XCTestCase {
        var interactor: EnvironmentListInteractor!

        // MARK: - Test Objects
        var presenterMock: EnvironmentListInteractorToPresenterInterfaceMock!

        override func setUp() {
                super.setUp()

                interactor = EnvironmentListInteractor()
                presenterMock = EnvironmentListInteractorToPresenterInterfaceMock()

                interactor.presenter = presenterMock
        }

        // MARK: - Operational

        // MARK: - Presenter to Interactor Interface

}
