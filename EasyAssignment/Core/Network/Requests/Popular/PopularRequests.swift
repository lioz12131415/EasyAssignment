//
//  PopularRequests.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

internal protocol PopularNetworkRequests where Self: NetworkRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    var popular: PopularRequests { get }
}

class PopularRequests {
    
    fileprivate var apiKey: String {
        return Environment.apiKey()
    }
    
    fileprivate lazy var queue: DispatchQueue = {
        return DispatchQueue(label: "popular.requests.queue")
    }()
    
    internal func get(page: Int = 1, _ completion: @escaping(_ movies: [Movie]) -> Void) {
        let path = "/popular?api_key=\(apiKey)&page=\(page)"
        self.queue.async {
            Network.request(path: path, method: .get) { json in
                let array  = json["results"].arrayValue
                let movies = Movie.initialize(array: array)
                let sorted = Movie.sort(by: \.voteAverage)
                
                DispatchQueue.main.async {
                    completion(sorted)
                }
            } failure: { error in  }
        }
    }
}
