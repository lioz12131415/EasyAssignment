//
//  Environment.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

enum Environment {
    
    case staging
    case preprod
    case production
    
    internal static func apiKey(_ environment: Environment = .current) -> String {
        switch environment {
            case .staging:    return ""
            case .preprod:    return ""
            case .production: return "4170bf35f7a61b8012d65de6ad644b9b"
        }
    }
    
    internal static func baseUrl(_ environment: Environment = .current) -> String {
        switch environment {
            case .staging:    return ""
            case .preprod:    return ""
            case .production: return "https://api.themoviedb.org/3/movie"
        }
    }
    
    internal static func imageBaseUrl(_ environment: Environment = .current) -> String {
        switch environment {
            case .staging:    return ""
            case .preprod:    return ""
            case .production: return "https://image.tmdb.org/t/p/w500"
        }
    }
}

extension Environment {
    // ======================================= //
    // MARK: - Current Project Environment
    // ======================================= //
    internal static var current: Environment {
        return .production
    }
}

