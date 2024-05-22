//
//  Double.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension Double {
    // ============================================ //
    // MARK: - Rounded Double Decimal Point
    // ============================================ //
    func rounded(_ decimalPoint: Int) -> Double {
        let power = pow(10, Double(decimalPoint))
       return (self * power).rounded() / power
    }
}
