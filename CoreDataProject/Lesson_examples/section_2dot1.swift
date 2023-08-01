//
//  section_2dot1.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 7/31/23.
//

import CoreData
import SwiftUI

struct section_2dot1: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
        
    var body: some View {
        return VStack {
            List(ships, id: \.self) { ship in
                HStack {
                    Text(ship.name ?? "Unknown name")
                    Text(ship.universe ?? "Unknown universe")
                }
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe =  "Star Trek"
                
                let ship3 = Ship(context:moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context:moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                if moc.hasChanges {
                    try? moc.save()
                }
                
            }
        }
    }
}

struct section_2dot1_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        section_2dot1()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
