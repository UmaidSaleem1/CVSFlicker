//
//  FlickSearchViewControllerMock.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class FlickSearchViewControllerMock: UIViewController, FlickerSearchViewModelProtocol {

    // MARK: - Properties
    var viewModel = FlickerSearchViewModel()
    var flickerData = [GetFlickerAPI.Response.Items]()
    
    var showActivityIndicatorCalled = 0
    var hideActivityIndicatorCalled = 0
    var handleFlickerErrorCalled = 0
    
    // MARK: - Expectations
    var handleFlickerAPIErrorExpectation: XCTestExpectation?
    var loadFlickerDataExpectation: XCTestExpectation?
    var showIndicatorExpectation: XCTestExpectation?
    var hideIndicatorExpectation: XCTestExpectation?
    
    func loadFlickerData(_ flickerOpenData: [GetFlickerAPI.Response.Items]) {
        flickerData = flickerOpenData
        loadFlickerDataExpectation?.fulfill()
    }
    
    func showActivityIndicator() {
        showActivityIndicatorCalled += 1
        showIndicatorExpectation?.fulfill()
    }
    
    func hideActivityIndicator() {
        hideActivityIndicatorCalled += 1
        hideIndicatorExpectation?.fulfill()
    }
    
    func handleAPIError(apiName: String) {
        handleFlickerErrorCalled += 1
        handleFlickerAPIErrorExpectation?.fulfill()
    }
}
