//
//  Contact.swift
//  learnNavigationView
//
//  Created by huaixi on 04/08/2021.
//

import Foundation
import SwiftUI
//when passing into custom class into list, needs to be identifiable
//to identify every instance
struct Contact: Identifiable {
    let imageName: String
    let name: String
    let phone: String
    let email: String
    let address: String
    let id = UUID()
}

let contact = [
    Contact(imageName: "Murni Kelana Jaya",
            name: "Murni Kelana Jaya",
            phone: "0177550798",
            email: "murniKelanaJaya@gmail.com",
            address: "29 & 29A, Jalan SS 6/12, Kelana Jaya, Petaling Jaya, Selangor 47301 Malaysia"),
    
    Contact(imageName: "Murni SS2",
            name: "Murni SS2",
            phone: "0177551565",
            email: "murniSs2@gmail.com",
            address: "53, Jalan SS 2/75 Petaling Jaya Selangor 47300 Malaysia"),
    
    Contact(imageName: "Murni Bukit Jalil",
            name: "Murni Bukit Jalil",
            phone: "0177553735",
            email: "murniBukitJalil@gmail.com",
            address: "No 41, Jalan 16/155C, Bandar Bukit Jalil Kuala Lumpur 57000 Malaysia"),
    
    Contact(imageName: "Murni Sunway Mentari",
            name: "Murni Sunway Mentari",
            phone: "0177550690",
            email: "murniSunwayMentari@gmail.com",
            address: "No 12, Jalan PJS 8/13, Dataran Mentari, Petaling Jaya, Selangor 46150 Malaysia"),
    
    Contact(imageName: "Murni Discovery Cheras",
            name: "Murni Discovery Cheras",
            phone: "0177558016",
            email: "murniDiscoveryCheras@gmail.com",
            address: "B-37-G & B-39-G, Pusat Perniagaan Danau Lumayan, Jalan Danau Lumayan, Bandar Sri Permaisuri Cheras Kuala Lumpur 56000 Malaysia"),
    
    Contact(imageName: "Murni Shah Alam",
            name: "Murni Shah Alam",
            phone: "0177558127",
            email: "murniShahAlam@gmail.com",
            address: "ACG-47, Blok A, Jalan Plumbum AC7/AC, Pusat Komersil Seksyen 7, Shah Alam Selangor 40000 Malaysia")
]
