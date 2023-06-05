//
//  orderItemView.swift
//  Murni Discovery
//
//  Created by huaixi on 09/09/2021.
//

import SwiftUI


struct OrderItemView: View {
    //use binding to update price, achieve real time update
    @Binding var orderItem: OrderItem
    @Binding var orderItems: [OrderItem]
    
    var body: some View {
        
        ZStack{
            HStack{
                //food image
                Image(orderItem.itemImage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10){
                    //food name
                    Text(orderItem.itemName)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    //food description
                    Text(orderItem.itemDescription)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.darkGrey)
                    //food unit price and quantity
                    HStack(spacing: 15) {
                        Text("Unit Price:\n" + getPrice(value: orderItem.itemPrice))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Text("Quantity:\n" + "\(orderItem.itemQuantity)")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .background(Color.gold.opacity(0.5))
                    }
                }
            }
            .padding()
            .background(Color.pearlWhite)
        }
    }
}


func getPrice(value: Float) -> String{
    let format = NumberFormatter()
    // currency format
    format.numberStyle = .currency
    return format.string(from: NSNumber(value: value)) ?? ""
}
