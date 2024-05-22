//
//  Network.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation
import AFNetworking

public class Network: NetworkSession {
    
    internal static var baseUrl: String {
        get { return Environment.baseUrl() }
    }
    
    internal static var requests: NetworkRequests =  {
        return NetworkRequests()
    }()
}

extension Network {
    // ======================================== //
    // MARK: - Request
    // ======================================== //
    internal static func request(path:    String,
                                 method:  Method,
                                 version: Version = .none,
                                 params:  Dictionary<String, Any>? = nil,
                                 result:  @escaping (Result),
                                 failure: @escaping(Failure)) {

        var fullPath = "\(baseUrl)\(version.rawValue)\(path)"
    
        config(token: .empty /* SOME TOKEN */, type: "application/json")
        fullPath = fullPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
        
        switch method {
            case .put: putRequest(path: fullPath, params: params, success: { (json) in
                result ( json )
            }) { (error) in failure ( error ) /* Error */ }

            case .get: getRequest(path: fullPath, params: params, success: { (json) in
                result ( json )
            }) { (error) in failure ( error ) /* Error */ }

            case .post: postRequest(path: fullPath, params: params, success: { (json) in
                result ( json )
            }) { (error) in failure ( error ) /* Error */ }

            case .delete: deleteRequest(path: fullPath, params: params, success: { (json) in
                result ( json )
            }) { (error) in failure ( error ) /* Error */ }
        }
    }
}

extension Network {
    // ======================================== //
    // MARK: - Config
    // ======================================== //
    fileprivate static func config(token: String, type: String) {
        session.requestSerializer = AFJSONRequestSerializer()
        session.responseSerializer = AFJSONResponseSerializer(readingOptions: .allowFragments)

        session.requestSerializer.stringEncoding = String.Encoding.utf8.rawValue
        session.responseSerializer.acceptableContentTypes = contentTypes

        session.requestSerializer.setValue(token,  forHTTPHeaderField: "Authorization")
        /*
         * */
        session.requestSerializer.setValue("application/json",  forHTTPHeaderField: "Content-Type")
        session.requestSerializer.setValue("application/json",  forHTTPHeaderField: "Accept")
    }
}

extension Network {
    // ======================================== //
    // MARK: -
    // ======================================== //
    fileprivate static var contentTypes: Set<String> {
        return Set<String>(["text/xml",
                            "text/json",
                            "text/html",
                            "text/javascript",
                            "application/json"])
    }
}



