//
//  Category.swift
//  Murni Discovery
//
//  Created by huaixi on 23/07/2021.
//

import SwiftUI

//Categories' id, icon, name and respective collection
struct Category: Identifiable {
    //UUID to identify each category (item)
    //uuidString returns a string created from UUID
    var id: String = UUID().uuidString
    var categoryIcon: String
    var categoryName: String
    var categoryCollection: [Item]
}

//collection(dictionary)
//contain respective category icon image name, category name and collection
var category = [
    Category(categoryIcon: "localFlavours",
             categoryName: "Local Flavours",
             categoryCollection: localFlavours),
    
    Category(categoryIcon: "chicken",
             categoryName: "Chicken",
             categoryCollection: chicken),
    
    Category(categoryIcon: "meeRaja",
             categoryName: "Mee Raja",
             categoryCollection: meeRaja),
    
    Category(categoryIcon: "seafood",
             categoryName: "Seafood",
             categoryCollection: seafood),
    
    Category(categoryIcon: "mamakDrinks",
             categoryName: "Mamak Drinks",
             categoryCollection: mamakDrinks)
]

