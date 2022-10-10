//
//  Filter_Bar_Tests.swift
//  Block Directory Tests
//
//  Created by Dave Piernick on 10/10/22.
//

import XCTest
@testable import Block_Directory

final class Filter_Bar_Tests: XCTestCase {

    let directory = DirectoryViewController()
    
    override func setUpWithError() throws {
        let window = UIWindow()
        window.addSubview(directory.view)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testButtonUpdated() {
        directory.filterBar.employeeType = .fullTime
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.directory.filterBar.filterButton.titleLabel?.text == "Full Time")
        }
    }
    
    func testFilterButtonActivate() {
        directory.filterBar.resignFirstResponder()
        directory.filterBar.filterButtonTapped()
        XCTAssertTrue(directory.filterBar.teamPicker.isFirstResponder == true)
    }
    
    func testFilterButtonDeactivate() {
        directory.filterBar.teamPicker.becomeFirstResponder()
        directory.filterBar.filterButtonTapped()
        XCTAssertTrue(directory.filterBar.teamPicker.isFirstResponder == false)
    }
    
    func testLabel1Employee() {
        directory.filterBar.updateLabelAnimated(1, false)
        XCTAssertTrue(directory.filterBar.label.text == "1 Employee")
    }
    
    func testLabel2Employees() {
        directory.filterBar.updateLabelAnimated(2, false)
        XCTAssertTrue(directory.filterBar.label.text == "2 Employees")
    }
}
