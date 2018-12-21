import UIKit
import XCTest

@testable import Sidekick

class EnvironmentListWireframeTests: XCTestCase {
    var wireframe: EnvironmentListWireframe!
    
    // MARK: - Test Objects
    var presenterMock: EnvironmentListWireframeToPresenterInterfaceMock!
    var viewMock: EnvironmentListNavigationInterfaceMock!
    
    override func setUp() {
        super.setUp()
        
        wireframe = EnvironmentListWireframe()
        presenterMock = EnvironmentListWireframeToPresenterInterfaceMock()
        viewMock = EnvironmentListNavigationInterfaceMock()
        
        wireframe.presenter = presenterMock
        wireframe.view = viewMock
    }
    
    // MARK: - Init
    func testInitWithNothingShouldInstantiateVIPERStackAndConnectLayers() {
        // Arrange
        wireframe = EnvironmentListWireframe()
        
        // Act
        
        // Assert
        XCTAssertNotNil(wireframe, "Wireframe cannot be nil after init")
        XCTAssertNotNil(wireframe.moduleInteractor, "Interactor cannot be nil after init")
        XCTAssertNotNil(wireframe.modulePresenter, "Presenter cannot be nil after init")
        XCTAssertNotNil(wireframe.moduleView, "View cannot be nil after init")
        
        XCTAssert (wireframe.modulePresenter === wireframe.moduleInteractor.presenter ? true : false, "Interactor's presenter must be the module's presenter")
        
        XCTAssert(wireframe.moduleInteractor === wireframe.modulePresenter.interactor ? true : false, "Presenter's interactor must be the module's interactor")
        XCTAssert(wireframe.moduleView === wireframe.modulePresenter.view ? true : false, "Presenter's view must be the module's view")
        XCTAssert(wireframe === wireframe.modulePresenter.wireframe ? true : false, "Presenter's wireframe must be the module'swireframe")
        
        XCTAssert(wireframe.modulePresenter === wireframe.moduleView.presenter ? true : false, "View's presenter must be the module's presenter")
        
        XCTAssert(wireframe.presenter === wireframe.modulePresenter ? true : false, "Wireframe's presenter must be the module's presenter")
        XCTAssert(wireframe.view === wireframe.moduleView ? true : false, "Wireframe's view must be the module's view")
    }
    
    // MARK: - Class Functions
    func testStoryboardWithNothingShouldReturnStoryboardWithEnvironmentListConstantsStoryboardIdentifier() {
        // Arrange
        let storyboard = EnvironmentListWireframe.storyboard()
        
        // Act
        
        // Assert
        let storyboardName = storyboard.value(forKey: "name") as? String
        XCTAssertNotNil(storyboardName)
        XCTAssertEqual(EnvironmentListConstants.storyboardIdentifier, storyboardName, "Storyboard identifier should be the constant identifier defined in the EnvironmentListWireframeProtocols file")
    }
    
    // MARK: - Operational
    func testGetDelegateWithAnyDelegateShouldAskPresenterForDelegate() {
        // Arrange
        
        // Act
        _ = wireframe.delegate
        
        // Assert
        XCTAssertTrue(presenterMock.functionsCalled.contains("delegate"))
    }
    
    func testSetDelegateWithAnythingShouldTellPresenterToSetNewDelegate() {
        // Arrange
        let testDelegate = EnvironmentListDelegateMock()
        
        // Act
        wireframe.delegate = testDelegate
        
        // Assert
        XCTAssertTrue(presenterMock.functionsCalled.contains("set(delegate:)"))
        XCTAssertTrue(presenterMock.modifiedDelegate === testDelegate)
    }
    
    // MARK: - Module Interface
    
    // What, with, should
    func testPresentOnWindowWithAnythingShouldTellPresenterBeganPresenting() {
        // Arrange
        let testWindow = UIWindow()
        
        // Act
        wireframe.presentViewController(fromWindow: testWindow)
        
        // Assert
        XCTAssertTrue(presenterMock.functionsCalled.contains("beginPresenting()"))
    }
    
    
    // MARK: - Presenter to Wireframe Interface
    
}
