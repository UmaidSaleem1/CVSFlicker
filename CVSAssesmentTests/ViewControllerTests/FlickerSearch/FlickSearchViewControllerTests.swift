//
//  FlickSearchViewControllerTests.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class FlickSearchViewControllerTests: XCTestCase {

    private var sut: FlickSearchViewController!
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    private func initializeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "FlickSearchViewController") as? FlickSearchViewController
        sut.loadViewIfNeeded()
    }
    
    func testOutletsAreConnected() {
        initializeViewController()
          
        XCTAssertNotNil(sut.flickerTxt)
    }
}
