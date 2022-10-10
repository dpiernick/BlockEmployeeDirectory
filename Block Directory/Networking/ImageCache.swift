//
//  ImageCache.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = NSCache<NSString, UIImage>()
    
    static func fetchImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = ImageCache.shared.object(forKey: NSString(string: url)) {
            completion(cachedImage)
        } else {
//            NetworkRequest.request(method: .get, urlString: url) { data in
//                if let data = data, let fetchedImage = UIImage(data: data) {
//                    completion(fetchedImage)
//                    ImageCache.shared.setObject(fetchedImage, forKey: NSString(string: url))
//                }
//            }
        }
    }
}
