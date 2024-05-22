//
//  CoreDataManeger.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import CoreData
import Foundation

internal class CoreDataManeger {
            
    /*
     * MARK: - xcdatamodeld Name
     * */
    internal static var name: String {
        return "CoreData"
    }
    
    /*
     * MARK: - Context
     * */
    internal static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    /*
     * MARK: - Persistent Container
     * */
    internal static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: name)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    /*
     * MARK: - Save Context
     * */
    internal static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

