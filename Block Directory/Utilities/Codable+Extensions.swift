//
//  Codable+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
    static func decode(dictionary: [String: Any]) -> Self? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed) else { return nil }
        return try? JSONDecoder().decode(Self.self, from: data)
    }

    static func decode(data: Data) -> Self? {
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}
