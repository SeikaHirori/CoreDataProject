//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 6/9/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController: DataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
