//
//  OrderViewModel.swift
//  Murni Discovery
//
//  Created by huaixi on 09/09/2021.
//

import SwiftUI
import Firebase

class OrderViewModel: ObservableObject {
    
    @Published var orderData = [OrderItem]()
    
    init(){
        let database = Firestore.firestore()
        //read data from firestore database
        //order by timeAdded
        database.collection("order").order(by: "timeAdded").addSnapshotListener { (snap, error) in
            if error != nil{
                //print out error dscription if error
                print((error?.localizedDescription)!)
                return
            }

            for oneItem in snap!.documentChanges{
                
                if oneItem.type == .added{
                    let id = oneItem.document.documentID
                    let userEmail = oneItem.document.get("userEmail") as! String
                    let itemImage = oneItem.document.get("itemImage") as! String
                    let itemName = oneItem.document.get("itemName") as! String
                    let itemDescription = oneItem.document.get("itemDescription") as! String
                    let itemPrice = oneItem.document.get("itemPrice") as! Float
                    let itemQuantity = oneItem.document.get("itemQuantity") as! NSNumber
                    let timeAdded = oneItem.document.get("timeAdded") as! Timestamp
                    
                    //append one item to order data, order data gathers all item added into order by user
                    self.orderData.append(
                        OrderItem(id: id, userEmail: userEmail, itemName: itemName, itemDescription: itemDescription, itemPrice: itemPrice, itemImage: itemImage, itemQuantity: itemQuantity, timeAdded: timeAdded.dateValue())
                    )

                    
                }
                
                if oneItem.type == .modified{
                    let id = oneItem.document.documentID
                    let itemQuantity = oneItem.document.get("itemQuantity") as! NSNumber
                    
                    for index in 0..<self.orderData.count{
                        if self.orderData[index].id == id{
                            self.orderData[index].itemQuantity = itemQuantity
                        }
                    }
                }
            }
        }
    }
}
