//
//  NetworkError.Builder.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension NetworkError {
    // ======================================== //
    // MARK: - Error Objc Builder class.
    // ======================================== //
    public class Builder {
       
        private var error: NetworkError
        
        init() {
            self.error = .empty
        }
    
        internal func set(statusCode: Int) -> Self {
            error.statusCode = statusCode
            return self
        }
        internal func set(message: String) -> Self {
            error.message = message
            return self
        }
        internal func build() -> NetworkError {
            return error
        }
    }
}


