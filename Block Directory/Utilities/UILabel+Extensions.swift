//
//  UILabel+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation
import UIKit

//initializers
extension UILabel {
    convenience init(_ title: String, size: CGFloat = 16, weight: UIFont.Weight = .regular) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = title
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.tintColor = .customTextColor
    }
}
