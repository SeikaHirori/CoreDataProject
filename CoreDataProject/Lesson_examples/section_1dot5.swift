//
//  section_1dot5.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 7/31/23.
//

import SwiftUI

struct section_1dot5: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {

        return VStack {
            HStack {
                Button("Add") {
                    let newWizard = Wizard(context: moc)
                    newWizard.name = "Harry Potter"
                }
                
                Button("Save") {
                    do {
                        if moc.hasChanges {
                            try moc.save()
                            print("new entries saved")
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
        }

    }
}

struct section_1dot5_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        section_1dot5()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            
    }
}
