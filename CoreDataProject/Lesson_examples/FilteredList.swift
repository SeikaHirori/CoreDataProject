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
    let sortedDescript: [SortDescriptor] = [SortDescriptor<Any>]()
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        return List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(sortedDescriptorType: [NSSortDescriptor] = [],filterKey: String, filterValue: String, nsParameter: String, @ViewBuilder content: @escaping (T) -> Content) {
        
        
        
        if filterValue.isEmpty {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortedDescriptorType, predicate: nil)
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortedDescriptorType, predicate: NSPredicate(format: "%K \(nsParameter) %@", filterKey, filterValue))
        }
            
        self.content = content
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()

    
    static var previews: some View {
        
        // Copy and pasted closure to re-enable previews
        FilteredList(sortedDescriptorType: [], filterKey: "lastName", filterValue: "", nsParameter: "BEGINSWITH[c]") { (singer:Singer) in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
