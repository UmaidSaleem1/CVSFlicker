//
//  FlickerAPIServiceControllerTests.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class FlickerAPIServiceControllerTests: XCTestCase {
    
    private var sut: GetFlickerAPIServiceController?
    
    override func setUp() {
        super.setUp()
        sut = GetFlickerAPIServiceController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccess() {
        NetworkManagerMock.testingParams = ["GetFlickerAPIDataSuccess"]
        sut?.getFlickerAPIData(queryString: "porcupine", ({ (response) in
            switch response {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
        }))
    }
    
    func testFailure() {
        NetworkManagerMock.testingParams = ["TestFailure"]
        sut?.getFlickerAPIData(queryString: "porcupine", { (response) in
            switch response {
            case .success(_):
                XCTFail()
            case .failure(_):
                break
            }
        })
    }
    
    func testNilData() {
        NetworkManagerMock.testingParams = ["TestNilData"]
        sut?.getFlickerAPIData(queryString: "porcupine", { (response) in
            switch response {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.code, nil)
                XCTAssertEqual(error.message, StringConstants.ErrorMessage.noData)
            }
        })
    }
    
    func testJSONDecodingError() {
        NetworkManagerMock.testingParams = ["JSONDecodingError"]
        sut?.getFlickerAPIData(queryString: "porcupine", { (response) in
            switch response {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.code, nil)
                XCTAssertEqual(error.message, StringConstants.ErrorMessage.jsonDecodingError)
            }
        })
    }
}
