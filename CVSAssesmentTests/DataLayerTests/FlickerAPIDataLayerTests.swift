//
//  FlickerAPIDataLayerTests.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class FlickerAPIDataLayerTests: XCTestCase {

    private var sut: GetFlickerAPIDataLayer?
    private var mockServiceController = FlickerAPIServiceControllerMock()

    override func setUp() {
        super.setUp()
        sut = GetFlickerAPIDataLayer()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulResponse() {
        mockServiceController.testingParams = ["testSuccess"]
        sut?.retrieveData(queryString: "porcupine", {(response) in
            switch response {
            case .success(_): break
                // success block is a passing test
            case .failure(_):
                XCTFail()
            }
        })
    }

    func testFailureResponse() {
        mockServiceController.testingParams = ["testFailure"]
        sut?.retrieveData(queryString: "porcupine", {(response) in
            switch response {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.code, nil)
                XCTAssertEqual(error.message, StringConstants.ErrorMessage.errorMessage)
            }
        })
    }
}
