//
//  DataController.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/4/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription) ")
                return
            }
            
            // This handles the duplicate objects based on their properties
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
