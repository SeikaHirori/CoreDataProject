//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 8/1/23.
//

import CoreData
import SwiftUI

// // SPECIFIC to Singer
//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//
//    var body: some View {
//        return List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//
//    }
//
//    init(filterKey: String, filterValue: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey,filterValue))
//    }
//}

 // Focused on generics
struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        return List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey,filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var dataController: DataController = DataController()
//
//    
//    static var previews: some View {
//        FilteredList(filterKey: "lastName", filterValue: "a")
//            .environment(\.managedObjectContext, dataController.container.viewContext)
//    }
//}
