//
//  FlickerSearchViewModelTests.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class FlickerSearchViewModelTests: XCTestCase {

    private var sut: FlickerSearchViewModel!
    private var mockView = FlickSearchViewControllerMock()
    
    override func setUp() {
        super.setUp()
        sut = FlickerSearchViewModel()
        sut.delegate = mockView
        mockView.viewModel = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateFlickerRandomData() {
        let successExpectation = XCTestExpectation(description: "successExpectation")
        mockView.loadFlickerDataExpectation = successExpectation
        let showActivityIndicatorExpectation = XCTestExpectation(description: "showActivityIndicatorExpectation")
        mockView.showIndicatorExpectation = showActivityIndicatorExpectation
        let hideActivityIndicatorExpectation = XCTestExpectation(description: "hideActivityIndicatorExpectation")
        mockView.hideIndicatorExpectation = hideActivityIndicatorExpectation
        
        mockView.viewModel.getFlickerData(imageName: "")
        wait(for: [successExpectation, showActivityIndicatorExpectation, hideActivityIndicatorExpectation], timeout: 5.0)
        
        // Validate results
        XCTAssertEqual(mockView.flickerData.count, 20)
    }
    
    func testCreateFlickerAPIDataPopulated() {
        let successExpectation = XCTestExpectation(description: "successExpectation")
        mockView.loadFlickerDataExpectation = successExpectation
        let showActivityIndicatorExpectation = XCTestExpectation(description: "showActivityIndicatorExpectation")
        mockView.showIndicatorExpectation = showActivityIndicatorExpectation
        let hideActivityIndicatorExpectation = XCTestExpectation(description: "hideActivityIndicatorExpectation")
        mockView.hideIndicatorExpectation = hideActivityIndicatorExpectation
        
        mockView.viewModel.getFlickerData(imageName: "porcupine")
        
        wait(for: [successExpectation, showActivityIndicatorExpectation, hideActivityIndicatorExpectation], timeout: 5.0)
        // Validate results
        XCTAssertEqual(mockView.flickerData.count, 20)
    }

}
