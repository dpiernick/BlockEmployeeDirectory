//
//  Utility_Tests.swift
//  Block Directory Tests
//
//  Created by Dave Piernick on 10/10/22.
//

import XCTest
@testable import Block_Directory

final class Utility_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncodableToDictionary() {
        let employee = Employee(uuid: "Test", full_name: "Test Name", email_address: "Email", team: "Team", employee_type: .fullTime)
        XCTAssertNotNil(employee.toDictionary)
    }
    
    func testDecodeDictionary() {
        var employee = [String: Any]()
        employee["uuid"] = "Test"
        employee["full_name"] = "Test"
        employee["email_address"] = "Test"
        employee["team"] = "Test"
        employee["employee_type"] = EmployeeType.fullTime.rawValue
        
        XCTAssertNotNil(Employee.decode(dictionary: employee))
    }
    
    func testDictionaryToJSON() {
        
        var testDict = [String: Any]()
        testDict["key"] = "value"
        
        let jsonString = "{\n  \"key\" : \"value\"\n}"
        
        XCTAssertTrue(testDict.jsonString == jsonString)
    }
    
    func testPhoneNumberFormatting() {
        XCTAssertTrue("3135554242".phoneNumberFormatted() == "(313) 555-4242")
    }
    
    func testPhoneNumberFormatFail() {
        XCTAssertTrue("ABC123".phoneNumberFormatted() == "ABC123")
    }
}
