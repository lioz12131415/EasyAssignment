//
//  String.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension String {
    // ================================ //
    // MARK: - Empty String
    // ================================ //
    public static var empty: String {
        return ""
    }
}

extension String {
    // ================================ //
    // MARK: - Convert String To URL
    // ================================ //
    public var convertToUrl: URL? {
        return URL(string: replacingOccurrences(of: " ", with: "%20"))
    }
}
