//
//  Block_Directory_Tests.swift
//  Block Directory Tests
//
//  Created by Dave Piernick on 10/6/22.
//

import XCTest
@testable import Block_Directory

final class Block_Directory_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkRequestValidURL() {
        var model: EmployeeModel?
        let expectation = self.expectation(description: "responseValid")
        
        NetworkRequest.request(method: .get, urlString: EmployeeURLs.correctURL) { data in
            if let data = data, let m = EmployeeModel.decode(data: data) {
                model = m
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(model)
    }
    
    func testNetworkRequestMalformedURL() {
        var model: EmployeeModel?
        let expectation = self.expectation(description: "requestValid")
        
        NetworkRequest.request(method: .get, urlString: EmployeeURLs.malformedURL) { data in
            if let data = data, let m = EmployeeModel.decode(data: data) {
                model = m
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        XCTAssertNil(model)
    }
    
    func testNetworkRequestEmptyURL() {
        var model: EmployeeModel?
        let expectation = self.expectation(description: "requestEmpty")
        
        NetworkRequest.request(method: .get, urlString: EmployeeURLs.emptyURL) { data in
            if let data = data, let m = EmployeeModel.decode(data: data) {
                model = m
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(model)
        XCTAssertTrue(model?.employees.count == 0)
    }
    
    func testCacheImage() {
        let image = UIImage(systemName: "testtube.2")!
        ImageCache.shared.setObject(image, forKey: "testURL")
        
        let employee = Employee(uuid: "1234", full_name: "Dave", email_address: "Dave@test.com", photo_url_small: "testURL", team: "TestTeam", employee_type: .contractor)
        
        let view = EmployeeSummaryView(employee)
        XCTAssertTrue(view.imageView.image == image)
    }
    
    

}
