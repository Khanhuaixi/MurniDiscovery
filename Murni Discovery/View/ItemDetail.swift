//
//  LocalFlavoursDetail.swift
//  Murni Discovery
//
//  Created by huaixi on 09/09/2021.
//

import SwiftUI
import Firebase

struct ItemDetail: View {
    
    @Binding var showItemDetail: Bool
    @Binding var selectedItem: Item
    @State var quantity = 1

    var body: some View {
        VStack {
            ScrollView{
                VStack{
                    HStack {
                        Button(action:{
                            //close view, return to previews page
                            //add animation
                            withAnimation(.spring()){
                                showItemDetail.toggle()
                            }
                        }){
                            Image("chevron")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    
                    VStack {
                        //food image
                        Image(selectedItem.itemImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        //food name
                        Text(selectedItem.itemName)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        //food description
                        Text(selectedItem.itemDescription)
                            .foregroundColor(.darkGrey)
                            .padding()
                        //stepper for item quantity
                        Stepper(onIncrement: {
                            self.quantity += 1
                        }, onDecrement: {
                            if self.quantity > 1 {
                                self.quantity -= 1
                            }
                        }) {
                            Text("Quantity: \(self.quantity)")
                        }
                        .padding()
                       
                    }
                    .background(Color.halfColonialWhite)
                    .cornerRadius(15)
                    .padding()
                    
                    Button(action: {
                        let database = Firestore.firestore()
                        database.collection("order")
                            .document()
                            .setData([
                                "userEmail": Auth.auth().currentUser?.email ?? "",
                                "itemImage": selectedItem.itemImage,
                                "itemName": selectedItem.itemName,
                                "itemDescription": selectedItem.itemDescription,
                                "itemPrice": selectedItem.itemPrice,
                                "itemQuantity": self.quantity,
                                "timeAdded": Date()
                            ]) { error in //error = error code
                                
                                if error != nil{
                                    print((error?.localizedDescription)!)
                                    return
                                }
                            }
                    }){
                        Text("ADD TO ORDER")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.green)
                            .cornerRadius(15)
                    }
                    .padding(.vertical)
                }
            }
            .padding()
            //80 is header height, 75 is tab bar height
            .frame(maxHeight: getRect().height - (80 + 75), alignment: .center)
        }
    }
}


