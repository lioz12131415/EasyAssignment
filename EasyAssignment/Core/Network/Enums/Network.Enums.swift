//
//  Network.Enums.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension Network {
    // ======================================== //
    // MARK: -
    // ======================================== //
    public enum Method: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
    }
}

extension Network {
    // ======================================== //
    // MARK: -
    // ======================================== //
    public enum Version: String {
        case none = "/"
        case v1o0 = "/v1/"
        case v2o0 = "/v2/"
        case v3o0 = "/v3/"
        case v3o1 = "/v3.1/"
    }
}
