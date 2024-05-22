//
//  KeyPath.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension KeyPath {
    // ================================================= //
    // MARK: - KeyPath Label Value
    // ================================================= //
    var label: String {
        return ("\(self)".components(separatedBy: ".").last ?? "")
    }
}

