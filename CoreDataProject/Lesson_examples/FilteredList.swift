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
    
    init(filterKey: String, filterValue: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey,filterValue))
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()

    
    static var previews: some View {
        FilteredList(filterKey: "lastName", filterValue: "a")
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
