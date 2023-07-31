//
//  section_1dot2.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 7/31/23.
//

import SwiftUI

struct section_1dot2: View {
    let students:[Student] = [
        Student(name: "Harry Potter"),
        Student(name: "Hermione Granger")
    ]
    
    var body: some View {
        
        List(students, id: \.self) { student in
            HStack {
                Text(student.name)
                Text(student.hashValue.formatted()) // Observational & Testing purposes
            }
        }
    }
}

struct section_1dot2_Previews: PreviewProvider {
    static var previews: some View {
        section_1dot2()
    }
}

struct Student:Hashable {
    let name: String
}
