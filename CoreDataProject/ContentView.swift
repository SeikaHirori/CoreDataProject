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
        // TODO
        let candy1 = Candy(context: moc)
        candy1.name = "Mars"
        candy1.origin = Country(context: moc)
        candy1.origin?.shortName = "UK"
        
        let candy2 = Candy(context: moc)
        candy2.name = "KitKat"
        candy2.origin = Country(context: moc)
        candy2.origin?.shortName = "UK"
        candy2.origin?.fullName = "United Kingdom"

        let candy3 = Candy(context: moc)
        candy3.name = "Twix"
        candy3.origin = Country(context: moc)
        candy3.origin?.shortName = "UK"
        candy3.origin?.fullName = "United Kingdom"
        
        let candy4 = Candy(context: moc)
        candy4.name = "Toblerone"
        candy4.origin = Country(context: moc)
        candy4.origin?.shortName = "CH"
        candy4.origin?.fullName = "Switzerland"
    }
    
    func saveExample() -> Void {
        do {
            if moc.hasChanges {
                try moc.save()
            } else {
                print("nothing to change :O")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
