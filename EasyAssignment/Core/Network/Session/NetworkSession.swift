//
//  NetworkSession.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import SwiftyJSON
import AFNetworking

open class NetworkSession {
    
    typealias Result  = (_ json:  JSON)         -> Void
    typealias Failure = (_ error: NetworkError) -> Void
    
    internal static let session = AFHTTPSessionManager()
}

extension NetworkSession {
    // ======================================== //
    // MARK: - Network Session GET Method
    // ======================================== //
    internal static func getRequest(path:    String,
                                    params:  Dictionary<String, Any>?=nil,
                                    success: @escaping(Result), failure: @escaping(Failure)) {
        session.get(path, parameters: params, headers: nil, progress: nil, success: { (task, any) in

            self.success(any:     any,
                         task:    task,
                         success: success,
                         failure: failure)
            
        }) { (task, error) in
            self.failure(path:    path,
                         task:    task,
                         params:  params,
                         success: success,
                         failure: failure)

            guard let dictionary = error.errorResponse else {
                return
            }
            failure(
                NetworkError.Builder()
                    .set(message:    dictionary["Message"]    as? String ?? .empty)
                    .set(statusCode: dictionary["HttpStatus"] as? Int    ?? -9999)
                    .build()
            )
        }
    }
}

extension NetworkSession {
    // ======================================== //
    // MARK: - Network Session POST Method
    // ======================================== //
    internal static func postRequest(path:    String,
                                     params:  Dictionary<String, Any>?=nil,
                                     success: @escaping(Result), failure: @escaping(Failure)) {
        session.post(path, parameters: params, headers: nil, progress: nil, success: { (task, any) in

            self.success(any:     any,
                         task:    task,
                         success: success,
                         failure: failure)

        }) { (session, error) in
            guard let dictionary = error.errorResponse else {
                return
            }
            failure(
                NetworkError.Builder()
                    .set(message:    dictionary["Message"]    as? String ?? .empty)
                    .set(statusCode: dictionary["HttpStatus"] as? Int    ?? -9999)
                    .build()
            )
        }
    }
}

extension NetworkSession {
    // ======================================== //
    // MARK: - Network Session PUT Method
    // ======================================== //
    internal static func putRequest(path:    String,
                                    params:  Dictionary<String, Any>? = ["PUT":"PUT"],
                                    success: @escaping(Result), failure: @escaping(Failure)) {
        session.put(path, parameters: params, headers: nil, success: { (task, any) in

            self.success(any:     any,
                         task:    task,
                         success: success,
                         failure: failure)

        }) { (session, error) in
            guard let dictionary = error.errorResponse else {
                return
            }
            failure(
                NetworkError.Builder()
                    .set(message:    dictionary["Message"]    as? String ?? .empty)
                    .set(statusCode: dictionary["HttpStatus"] as? Int    ?? -9999)
                    .build()
            )
        }
    }
}

extension NetworkSession {
    // ======================================== //
    // MARK: - Network Session DELETE Method
    // ======================================== //
    internal static func deleteRequest(path:    String,
                                       params:  Dictionary<String, Any>?=nil,
                                       success: @escaping(Result), failure: @escaping(Failure)) {
        session.delete(path, parameters: params, headers: nil, success: { (task, any) in

            self.success(any:     any,
                         task:    task,
                         success: success,
                         failure: failure)

        }) { (session, error) in
            guard let dictionary = error.errorResponse else {
                return
            }
            failure(
                NetworkError.Builder()
                    .set(message:    dictionary["Message"]    as? String ?? .empty)
                    .set(statusCode: dictionary["HttpStatus"] as? Int    ?? -9999)
                    .build()
            )
        }
    }
}

extension NetworkSession {
    // ======================================== //
    // MARK: -
    // ======================================== //
    fileprivate static func success(any:     Any?,
                                    task:    URLSessionDataTask,
                                    success: @escaping(Result), failure: @escaping(Failure)) {
        guard let any      = any,
              let response = task.response as? HTTPURLResponse else {
            return failure(
                .empty
            )
        }
        
        if response.statusCode >= 200 && response.statusCode < 300 {
            return success(
                JSON(any)
            )
        }
        if response.statusCode == 401 {
            // TODO: CLEAR USER TOKEN
        }
        failure(
            .empty
        )
    }
}

extension NetworkSession {
    // ======================================== //
    // MARK: -
    // ======================================== //
    fileprivate static func failure(path:    String,
                                    task:    URLSessionDataTask?,
                                    params:  Dictionary<String, Any>?=nil,
                                    success: @escaping(Result), failure: @escaping(Failure)) {
        guard let response = task?.response as? HTTPURLResponse else {
            return
        }
        guard response.statusCode == 401 else {
            return failure(
                NetworkError.Builder()
                    .set(statusCode: response.statusCode)
                    .build()
            )
        }
        session.requestSerializer.clearAuthorizationHeader()
    }
}

