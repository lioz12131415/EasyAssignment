//
//  Error.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import Foundation
import AFNetworking

extension Error {
    // ======================================== //
    // MARK: -
    // ======================================== //
    internal var errorKey: String {
        get { return AFNetworkingOperationFailingURLResponseDataErrorKey }
    }
}

extension Error {
    // ======================================== //
    // MARK: -
    // ======================================== //
    internal var errorResponse: Dictionary<String, Any>? {
        guard let userInfo = _userInfo,
              let data = userInfo[errorKey] as? Data,
              let response = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }

        guard let response = response as? Dictionary<String, Any> else {
                return nil
        }
        return response
    }
}
