//
//  LocalFlavoursCardView.swift
//  Murni Discovery
//
//  Created by huaixi on 08/09/2021.
//

import SwiftUI

struct ItemCardView: View {
    var item: Item
    
    var body: some View {
        //design single card view
        VStack{
            //price
            HStack{
                Spacer()
                Text("$" + String(format: "%.2f", item.itemPrice))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.vertical,5)
                    .padding(.horizontal,15)
                    .background(Color.gold.opacity(0.5))
                    .cornerRadius(10)
                    .padding(10)
            }
            //image
            Image(item.itemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            //name of food
            Text(item.itemName)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(.bottom)
        .background(Color.pearlWhite)
        .cornerRadius(15)
    }
}

struct ItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCardView(item: localFlavours[0])
    }
}
