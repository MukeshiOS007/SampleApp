
import XCTest

final class CricketAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionViewUI() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertEqual(app.collectionViews.count, 1)
        
        let collectionView = app.collectionViews.element(boundBy: 0)
        XCTAssertEqual(collectionView.cells.count, 3)
        
        let staticTest  = app.collectionViews.staticTexts["Indian Premier League"]
        
        let loadListCollectionView = app.collectionViews["load-List"]
        loadListCollectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).swipeUp()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["c Richard  b Brett Lee "]/*[[".cells.staticTexts[\"c Richard  b Brett Lee \"]",".staticTexts[\"c Richard  b Brett Lee \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        
        let matchButton = app.navigationBars["Scorecard"].buttons["Match"]
        matchButton.tap()
        loadListCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        matchButton.tap()
        loadListCollectionView.children(matching: .cell).element(boundBy: 2).staticTexts["Indian Premier League"].tap()
        matchButton.tap()
        
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
