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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct section_1dot5_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        section_1dot5()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            
    }
}
