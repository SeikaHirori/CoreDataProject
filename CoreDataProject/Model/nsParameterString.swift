//
//  nsParameterString.swift
//  CoreDataProject
//
//  Created by Seika Hirori on 8/11/23.
//

import Foundation

enum nsParameterString: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case beginsWithCaseInS = "BEGINSWITH[c]"
    case beginsWithCaseSen = "BEGINSWITH"
    case containsCaseInS = "CONTAINS[c]"
    case containsCaseSen = "CONTAINS"
    case endsWithCaseInS = "ENDSWITH[c]"
    case endsWithCaseSen = "ENDSWITH"
    
}
