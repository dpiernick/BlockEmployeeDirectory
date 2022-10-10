//
//  String+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation

extension String {
    func phoneNumberFormatted() -> String {
        guard self.count == 10 else { return self }
        
        let str = NSMutableString(string: self)
        str.insert("-", at: 6)
        str.insert(") ", at: 3)
        str.insert("(", at: 0)
        return str as String
    }
    
    static func employeeTypeFormatted(_ employeeType: EmployeeType?) -> String {
        switch employeeType {
        case .fullTime: return "Full Time"
        case .partTime: return "Part Time"
        case .contractor: return "Contractor"
        default: return "All"
        }
    }
}
