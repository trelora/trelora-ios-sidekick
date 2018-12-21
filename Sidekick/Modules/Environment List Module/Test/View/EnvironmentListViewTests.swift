import UIKit
import XCTest

@testable import Sidekick

class EnvironmentListViewTests: XCTestCase {
        var view: EnvironmentListView!

        // MARK: - Test Objects
        var presenterMock: EnvironmentListViewToPresenterInterfaceMock!

        override func setUp() {
                super.setUp()

                view = EnvironmentListView()
                presenterMock = EnvironmentListViewToPresenterInterfaceMock()

                _ = view.view

                view.presenter = presenterMock
        }

        // MARK: - Operational

        // MARK: - Presenter to View Interface

}
