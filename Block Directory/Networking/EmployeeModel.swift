//
//  EmployeeModel.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation

enum EmployeeType: String, Codable, CaseIterable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
}

struct EmployeeModel: Codable {
    var employees: [Employee]
}

struct Employee: Codable {
    var uuid: String
    var full_name: String
    var phone_number: String?
    var email_address: String
    var biography: String?
    var photo_url_small: String?
    var photo_url_large: String?
    var team: String
    var employee_type: EmployeeType
}
