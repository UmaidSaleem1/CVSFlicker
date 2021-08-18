//
//  GetFlickerAPIModelTests.swift
//  CVSAssesmentTests
//
//  Created by Muhammad Saleem (C) on 8/18/21.
//

import XCTest
@testable import CVSAssesment

class GetFlickerAPIModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
       
    }
    
    func testCreateResponseBody() {
        let response = GetFlickerAPI.Response(title: "Recent Uploads tagged porcupine", link: "https://www.flickr.com/photos/tags/porcupine/", description: "porcupine", modified: "2021-08-17T06:12:09Z", generator: "https://www.flickr.com", items: [GetFlickerAPI.Response.Items(title: "Ornamental Grass", link: "https://www.flickr.com/photos/merripat/51382853317/", date_taken: "2021-08-13T19:27:10-08:00", description: "<p><a href=\"https://www.flickr.com/people/merripat/\">merripat</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/merripat/51382853317/\" title=\"Ornamental Grass\"><img src=\"https://live.staticflickr.com/65535/51382853317_e25d7db8c9_m.jpg\" width=\"240\" height=\"169\" alt=\"Ornamental Grass\" /></a></p>", published: "2021-08-17T06:12:09Z", author: "nobody@flickr.com (\"merripat\")", author_id: "23370650@N06", tags: "ornamentalgrass ornamental grass grasses porcupinegrass decorativegrass decorative porcupine zebragrass zebra", media: GetFlickerAPI.Response.Items.Media(m: "https://live.staticflickr.com/65535/51382853317_e25d7db8c9_m.jpg"))])

        XCTAssertEqual(response.title, "Recent Uploads tagged porcupine")
        XCTAssertEqual(response.link, "https://www.flickr.com/photos/tags/porcupine/")
        XCTAssertEqual(response.description, "porcupine")
        XCTAssertEqual(response.modified, "2021-08-17T06:12:09Z")
        XCTAssertEqual(response.generator, "https://www.flickr.com")
        XCTAssertEqual(response.items?.first?.published, "2021-08-17T06:12:09Z")
        XCTAssertEqual(response.items?.first?.title, "Ornamental Grass")
        XCTAssertEqual(response.items?.first?.author, "nobody@flickr.com (\"merripat\")")
        XCTAssertEqual(response.items?.first?.author_id, "23370650@N06")
        XCTAssertEqual(response.items?.first?.tags, "ornamentalgrass ornamental grass grasses porcupinegrass decorativegrass decorative porcupine zebragrass zebra")
        
        
        // Similarly all properties of GetNYCOpenData response needs to be tested here
    }

}
