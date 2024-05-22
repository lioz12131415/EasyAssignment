//
//  NetworkRequests.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class NetworkRequests: PopularNetworkRequests {
    
    lazy var popular: PopularRequests = {
        return PopularRequests()
    }()
}
