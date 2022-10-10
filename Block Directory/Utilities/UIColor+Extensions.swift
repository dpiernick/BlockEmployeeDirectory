//
//  UIColor+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation
import UIKit

extension UIColor {
    static var customBackgroundColor: UIColor {
        return UIColor { traits in
            return traits.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        }
    }
    
    static var customTextColor: UIColor {
        return UIColor { traits in
            return traits.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        }
    }
}
