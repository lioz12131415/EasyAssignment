//
//  NetworkError.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class NetworkError {
    var statusCode = -9999
    var message    = "Server error"
}

extension NetworkError {
    // ======================================== //
    // MARK: -
    // ======================================== //
    internal static var empty: NetworkError {
        return NetworkError()
    }
}
