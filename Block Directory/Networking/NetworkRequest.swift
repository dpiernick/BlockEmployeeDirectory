//
//  NetworkRequest.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation

struct EmployeeURLs {
    static var correctURL = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    static var malformedURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    static var emptyURL = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
}

enum HTTPRequestMethod: String {
    case get = "GET"
}

struct NetworkRequest {
    
    static func request(method: HTTPRequestMethod, urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let session = URLSession(configuration: .default).dataTask(with: urlRequest) { data, urlResponse, error in
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
        
        session.resume()
    }
    
}
