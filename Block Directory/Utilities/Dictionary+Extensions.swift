//
//  Dictionary+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation

extension Dictionary {
    var jsonString: String {
        let invalidJson = "Invalid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJSONString() {
        print(jsonString)
    }
}
