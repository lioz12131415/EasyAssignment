//
//  NSManagedObjectProtocol.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import Combine
import CoreData
import Foundation

protocol NSManagedObjectProtocol where Self: NSManagedObject {
    
}

extension NSManagedObjectProtocol {
    // ============================================= //
    // MARK: - Protocol Variables
    // ============================================= //
    internal static var new: Self {
        return Self(context: CoreDataManeger.context)
    }
    
    internal static var last: Self? {
        return all.last
    }
    
    internal static var first: Self? {
        return all.first
    }
}

extension NSManagedObjectProtocol {
    // ============================================= //
    // MARK: - Protocol Save Methods
    // ============================================= //
    internal func save() {
        CoreDataManeger.saveContext()
    }
    
    internal static func save() {
        CoreDataManeger.saveContext()
    }
}

extension NSManagedObjectProtocol {
    // ============================================= //
    // MARK: - Protocol Get All Variables & Methods
    // ============================================= //
    internal static var all: Array<Self> {
        let fetchRequest = NSFetchRequest<Self>(entityName: String(describing: Self.self))
        guard let array = try? CoreDataManeger.context.fetch(fetchRequest) else {
            return []
        }
        return array
    }
    
    internal static func all(_ predicate: NSPredicate? = nil, _ sort: [NSSortDescriptor]? = nil) -> Array<Self> {
        let fetchRequest = NSFetchRequest<Self>(entityName: String(describing: Self.self))
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sort
        guard let array = try? CoreDataManeger.context.fetch(fetchRequest) else {
            return []
        }
        return array
    }
}

extension NSManagedObjectProtocol {
    // ============================================= //
    // MARK: - Protocol Fetch & Sort Methods
    // ============================================= //
    internal static func sort<Value>(by keyPath: KeyPath<Self, Value>, ascending: Bool = false) -> Array<Self> {
        let sort = NSSortDescriptor(key: keyPath.label, ascending: false)
        return all(nil, [sort])
    }
    
    internal static func fetch<Value>(where keyPath: KeyPath<Self, Value>, equalTo value: CVarArg) -> Self? {
        let predicate = NSPredicate(format: "\(keyPath.label) == %@", value)
        return all(predicate).first
    }
    
    internal static func fetchAll<Value>(where keyPath: KeyPath<Self, Value>, equalTo value: CVarArg) -> Array<Self> {
        let predicate = NSPredicate(format: "\(keyPath.label) == %@", value)
        return all(predicate)
    }
}




