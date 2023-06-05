//
//  AllFood.swift
//  Murni Discovery
//
//  Created by huaixi on 11/09/2021.
//

import SwiftUI

struct Item: Identifiable{
    var id = UUID().uuidString
    var itemName: String
    var itemDescription: String
    var itemPrice: Float
    var itemImage: String
}
//different collections by categories
//one collection contains many items
var localFlavours = [
    Item(itemName: "Nasi Lemak Ayam Goreng",
            itemDescription: "Fried crispy chicken served with the classic Malaysian steamed coconut milk rice with peanuts, anchovies, half sliced boiled egg, and 3 slices of cucumbers, and sambal paste.",
            itemPrice: 8.80,
            itemImage: "Nasi Lemak Ayam Goreng"),
    Item(itemName: "Nasi Lemak Ayam Pandan",
            itemDescription: "Fried aromatic Pandan Leaf chicken with a slight hint of sweetness from the Pandan aroma served with the classic Malaysian steamed coconut milk rice with peanuts, anchovies, half sliced boiled egg, 3 slices of cucumbers, and sambal paste.",
            itemPrice: 8.80,
            itemImage: "Nasi Lemak Ayam Pandan"),
    Item(itemName: "Nasi Lemak Biasa",
            itemDescription: "The classic Malaysian steamed coconut milk rice served with a sunny-side up egg, peanuts, anchovies, and 3 slices of cucumbers, and sambal paste.",
            itemPrice: 3.50,
            itemImage: "Nasi Lemak Biasa")
]

var chicken = [
    Item(itemName: "Chicken Maryland",
            itemDescription: "For those who love some deep-fried coated breadcrumbs chicken. Served with fries and coleslaw on lettuce with black pepper sauce (for the meat) and chilli sauce (for the fries).",
            itemPrice: 10.80,
            itemImage: "Chicken Maryland"),
    Item(itemName: "Chicken Napolean",
            itemDescription: "Murni Discovery’s signature deep-fried coated breadcrumbs chicken breast wrapping cheese, chicken ham, and chicken sausage, topped with mayonnaise. Served with fries and coleslaw on lettuce with black pepper sauce (for the meat) and chilli sauce (for the fries).",
            itemPrice: 14.80,
            itemImage: "Chicken Napolean"),
    Item(itemName: "Hailam Chicken Chop",
            itemDescription: "Murni Discovery’s Hailam crispy Chicken Chop topped with savoury sauce that is spicy and slightly sweet. Served with Baked Beans and Diced Potatoes mixed with margarine, black pepper, and chopped parsley leaves.",
            itemPrice: 14.90,
            itemImage: "Hailam Chicken Chop")
]

var meeRaja = [
    Item(itemName: "Mee Raja Fish & Chips",
            itemDescription: "King of Noodles with a pleasant and satisfying texture, stir fried. Added with crispy deep-fried dory fish and fries.",
            itemPrice: 21.00,
            itemImage: "Mee Raja Fish & Chips"),
    Item(itemName: "Mee Raja Original",
            itemDescription: "King of Noodles with a pleasant and satisfying texture, stir fried. Original but with extraordinary flavours",
            itemPrice: 9.00,
            itemImage: "Mee Raja Original"),
    Item(itemName: "Mee Raja Tomyam",
            itemDescription: "King of Noodles with a pleasant and satisfying texture cooked with the Thai spicy and sour Tom Yam paste.",
            itemPrice: 11.00,
            itemImage: "Mee Raja Tomyam")
]

var seafood = [
    Item(itemName: "Grilled Salmon Fish",
            itemDescription: "The name explains itself! Get your healthiest option of protein! Served with fries and coleslaw on lettuce.",
            itemPrice: 17.80,
            itemImage: "Grilled Salmon Fish"),
    Item(itemName: "Doctor Fillet",
            itemDescription: "Murni Discovery’s version of Chicken Tenders, Fingers, Goujons, Strips, Tendies or whatever you call it! Basically, boneless and meaty to satisfy your protein intake. Served with fries and coleslaw on lettuce with black pepper sauce (for the meat) and chilli sauce (for the fries).",
            itemPrice: 13.80,
            itemImage: "Doctor Fillet"),
    Item(itemName: "Seafood Wonderland",
            itemDescription: "Pasta with hot crispy onion rings, hot chilli and smoked garlic accompanied assorted seafood",
            itemPrice: 18.80,
            itemImage: "Seafood Wonderland")
]

var mamakDrinks = [
    Item(itemName: "Teh Ice",
            itemDescription: "Made by cooling a brew of hot tea and milk through the process of pouring and “pulling” it between two cups or mugs to create a rich, frothy drink.",
            itemPrice: 2.90,
            itemImage: "Teh Ice"),
    Item(itemName: "Teh O Ice",
            itemDescription: "Made by black tea without any addition of dairy products or creamers entirely, hence the 'O' stands for 'original'. Cool ice added to freshen your day.",
            itemPrice: 2.90,
            itemImage: "Teh O Ice"),
    Item(itemName: "Traffic Light Juice",
            itemDescription: "Fun juice layered with berry cordial, orange juice and green surgary juice.",
            itemPrice: 3.40,
            itemImage: "Traffic Light Juice")
]
