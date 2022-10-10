//
//  UIStackView+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/4/22.
//

import Foundation
import UIKit

//initializers
extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
    }
}
