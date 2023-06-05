//
//  OrderPayment.swift
//  Murni Discovery
//
//  Created by huaixi on 23/09/2021.
//

import SwiftUI

struct OrderPayment: View {
    @Binding var showOrderPayment: Bool
    @Binding var fullAddress: String
    @Binding var totalPayment: String
    @ObservedObject var locationManager = LocationManager.shared
    var body: some View {
        ZStack{
            ScrollView{
                HStack {
                    Button(action:{
                        //close view, return to previews page
                        //add animation
                        withAnimation(.spring()){
                            showOrderPayment.toggle()
                        }
                    }){
                        Image("chevron")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding([.top, .bottom])
                
                VStack {
                    Image("deliveryToDestination")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Delivery to:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.darkGrey)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    
                    if fullAddress.isEmpty && locationManager.userLocation != nil{
                        
                        Text("\(locationManager.formattedAddress)")
                            .font(.title2)
                            .foregroundColor(Color.darkGrey)
                            .multilineTextAlignment(.center)
                            .padding()
                    }else{
                        Text( "\(fullAddress)")
                            .font(.title2)
                            .foregroundColor(Color.darkGrey)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                }
                
                
                
                VStack {
                    //logo
                    Image("makePayment")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.top, 50)
                    
                    Text("Total Payment:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.darkGrey)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("\(totalPayment)")
                        .font(.title2)
                        .foregroundColor(Color.darkGrey)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing])
                }
                
                
                //caption
                Text("Please choose payment method...")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.darkGrey)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top)
                
                Button(action: {}){
                    HStack{
                        Text("Cash On Delivery")
                            .font(.title2)
                            .foregroundColor(.darkGrey)
                            .padding(.horizontal)
                        Spacer()
                        Image("cashOnDelivery")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding(10)
                            .padding(.trailing, 28)
                    }
                }
                .frame(width: getRect().width - 50, height: 70)
                .background(Color.grey.opacity(0.2))
                .clipShape(Rectangle())
                .cornerRadius(15)
                .padding(.top)
                
                Text("OR")
                    .fontWeight(.light)
                    .padding()
                
                Section{
                    Button(action: {}){
                        HStack{
                            Text("Maybank")
                                .font(.title2)
                                .foregroundColor(.darkGrey)
                                .padding(.horizontal)
                            Spacer()
                            Image("maybank")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(10)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    Button(action: {}){
                        HStack{
                            Text("Ambank")
                                .font(.title2)
                                .foregroundColor(.darkGrey)
                                .padding(.horizontal)
                            Spacer()
                            Image("ambank")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .padding(10)
                                .padding(.trailing, 28)
                                
                        }
                    }
                    
                    Button(action: {}){
                        HStack{
                            Text("CIMB Clicks")
                                .font(.title2)
                                .foregroundColor(.darkGrey)
                                .padding(.horizontal)
                            Spacer()
                            Image("cimbClicks")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .padding(10)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    Button(action: {}){
                        HStack{
                            Text("Public Bank")
                                .font(.title2)
                                .foregroundColor(.darkGrey)
                                .padding(.horizontal)
                            Spacer(minLength: 50)
                            Image("publicBank")
                                .resizable()
                                .frame(width: 40, height: 45)
                                .padding(10)
                                .padding(.trailing, 30)
                        }
                    }
                    
                    Button(action: {}){
                        HStack{
                            Text("RHB Bank")
                                .font(.title2)
                                .foregroundColor(.darkGrey)
                                .padding(.horizontal)
                            Spacer()
                            Image("rhbBank")
                                .resizable()
                                .frame(width: 80, height: 30)
                                .padding(10)
                        }
                    }
                    
                    
                }
                .frame(width: getRect().width - 50, height: 70)
                .background(Color.halfColonialWhite)
                .clipShape(Rectangle())
                .cornerRadius(15)
                .padding(.top)
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
        }
    }
}

struct OrderPayment_Previews: PreviewProvider {
    @State static var showUserLocationView = false
    @State static var fullAddress = "testing address"
    @State static var totalPayment = "$59.00"
    static var previews: some View {
        OrderPayment(showOrderPayment: $showUserLocationView, fullAddress: $fullAddress, totalPayment: $totalPayment)
    }
}
