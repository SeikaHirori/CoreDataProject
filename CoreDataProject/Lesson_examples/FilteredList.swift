//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 8/1/23.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        return List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }

    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH[c] %@", filter))
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()

    
    static var previews: some View {
        FilteredList(filter: "a")
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
