//
//  UIView+Extensions.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/4/22.
//

import Foundation
import UIKit

//initializers
extension UIView {
    convenience init(_ translatesIntoConstraints: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = translatesIntoConstraints
    }
}

//helpers
extension UIView {
    
    func addSubview(_ view: UIView, _ constraints: [NSLayoutConstraint]) {
        addSubview(view)
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubviewWithConstraints(_ subview: UIView, leading: CGFloat = 0, top: CGFloat = 0, trailing: CGFloat = 0, bottom: CGFloat = 0, useSafeArea: Bool = false) {
        self.addSubview(subview)
        
        if useSafeArea {
            NSLayoutConstraint.activate([
                subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
                subview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: top),
                subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing),
                subview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: bottom)
            ])
        } else {
            NSLayoutConstraint.activate([
                subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
                subview.topAnchor.constraint(equalTo: topAnchor, constant: top),
                subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing),
                subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            ])
        }
    }
    
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}
