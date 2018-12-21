import Foundation
import XCTest

@testable import Sidekick

class EnvironmentListPresenterTests: XCTestCase {
        var presenter: EnvironmentListPresenter!

        // MARK: - Test Objects
        var delegateMock: EnvironmentListDelegateMock!
        var interactorMock: EnvironmentListPresenterToInteractorInterfaceMock!
        var viewMock: EnvironmentListPresenterToViewInterfaceMock!
        var wireframeMock: EnvironmentListWireframeInterfacesMock!

        override func setUp() {
                super.setUp()

                presenter = EnvironmentListPresenter()
                delegateMock = EnvironmentListDelegateMock()
                interactorMock = EnvironmentListPresenterToInteractorInterfaceMock()
                viewMock = EnvironmentListPresenterToViewInterfaceMock()
                wireframeMock = EnvironmentListWireframeInterfacesMock()

                presenter.delegate = delegateMock
                presenter.interactor = interactorMock
                presenter.view = viewMock
                presenter.wireframe = wireframeMock
        }

        // MARK: - Operational
        func testModuleWireframeComputedVariableWithConnectedWireframeReturnsTheWireframeAsAEnvironmentListObject() {
                // Arrange

                // Act
                let moduleWireframe = presenter.moduleWireframe

                // Assert
                XCTAssert(moduleWireframe === wireframeMock)
        }

        // MARK: - Interactor to Presenter Interface

        // MARK: - View to Presenter Interface

        // MARK: - Wireframe to Presenter Interface
        func testSetDelegateWithAnythingShouldSetPresentersDelegate() {
                // Arrange
                presenter.delegate = nil
                let testDelegate = EnvironmentListDelegateMock()

                // Act
                presenter.set(delegate: testDelegate)

                // Assert
                XCTAssert(presenter.delegate === testDelegate)
        }
}
