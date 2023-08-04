//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        return VStack {
            if countries.isEmpty {
                Text("empty")
            } else {
                List {
                    ForEach(countries, id: \.self) { country in
                        Section(country.wrappedFullName) {
                            ForEach(country.candyArray, id:\.self) { candy in
                                Text(candy.wrappedName)
                            }
                        }
                    }
                }
            }
            
            
            HStack {
                Button("Add") {
                    addExample()
                }
                
                Button("Save") {
                    saveExample()
                }
            }
        }
        .padding()
    }
    
    func addExample() -> Void {
        
    }
    
    func saveExample() -> Void {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
