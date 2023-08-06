//
//  section_2dot2.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 8/1/23.
//

import CoreData
import SwiftUI

struct section_2dot2: View {
    @Environment(\.managedObjectContext) var moc
    @State private var filterValue:String = ""
    @State private var filterKey: String = "lastName"
    
    var body: some View {
        return VStack {
            HStack {
                TextField(
                    "Value",
                    text: $filterValue
                )
            }
            .padding()
            .border(.green)
            .clipShape(Capsule())
            
            // list of matching singers
            FilteredList(filterKey: filterKey, filterValue: filterValue) { (singer:Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            HStack {
                Button("Add Adele") {
                    let adele: Singer = Singer(context: moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"
                }
                Button("Add Examples") {
                    let taylor: Singer = Singer(context: moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"
                    
                    let ed: Singer = Singer(context: moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
                }
                .padding()
                
                Button("Save") {
                    do {
                        if moc.hasChanges {
                            try moc.save()
                            print("New entries saved")
                        } else {
                            print("Nothing was saved")
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                .padding()
            }
            
            
            
            HStack {
                Button("Show by Last name") {
                    filterKey = "lastName"
                    print("Changed to \(filterKey)")
                }
                .background(filterKey == "lastName" ? .primary: Color.secondary)
                
                Button("Show by First name") {
                    filterKey = "firstName"
                    print("Changed to \(filterKey)")
                }
                .background(filterKey == "firstName" ? .primary: Color.secondary)            }
        }

    }
    
    
}



struct section_2dot2_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        section_2dot2()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}


