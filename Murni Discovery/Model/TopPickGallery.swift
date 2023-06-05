//
//  TopPick.swift
//  Murni Discovery
//
//  Created by huaixi on 24/07/2021.
//

import SwiftUI
//contain id, medal(gold, silver or bronze), icon of the item, name of item and price of item
struct TopPickGallery: Identifiable {
    var id: String = UUID().uuidString
    var medal: String
    var icon: String
    var name: String
    var price: String
}

var topPicksGallery = [
    TopPickGallery(medal: "First Place",
            icon: "Nasi Lemak Ayam Goreng",
            name: "Nasi Lemak Ayam Goreng",
            price: "$8.80"),
    
    TopPickGallery(medal: "Second Place",
            icon: "Mee Raja Fish & Chips",
            name: "Mee Raja Fish & Chips",
            price: "$21.00"),
    
    TopPickGallery(medal: "Third Place",
            icon: "Chicken Maryland",
            name: "Chicken Maryland",
            price: "$10.80")
]
