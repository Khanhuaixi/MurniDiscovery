//
//  LocalFlavoursItem.swift
//  Murni Discovery
//
//  Created by huaixi on 09/09/2021.
//

import SwiftUI

//data will be fetched using OrderViewModel from firestore database
struct OrderItem: Identifiable {
    var id = UUID().uuidString
    var userEmail: String
    var itemName: String
    var itemDescription: String
    var itemPrice: Float
    var itemImage: String
    var itemQuantity: NSNumber
    var timeAdded: Date
}
