//
//  UIView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension UIView {
    // ============================================ //
    // MARK: -
    // ============================================ //
    internal func insert(to v: UIView?, at index: Int) {
        guard let v = v else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        v.insertSubview(self, at: index)
        
        autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight,
        ]
        widthAnchor.constraint(equalTo:   v.widthAnchor,   constant: 0).isActive = true
        heightAnchor.constraint(equalTo:  v.heightAnchor,  constant: 0).isActive = true
        centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0).isActive = true
        centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: 0).isActive = true
    }
}
