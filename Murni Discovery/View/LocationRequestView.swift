//
//  LocationRequestView.swift
//  Murni Discovery
//
//  Created by huaixi on 22/09/2021.
//

import SwiftUI

struct LocationRequestView: View {
    @Binding var showLocationRequestView: Bool
    @Binding var showOrderPayment: Bool
    @Binding var fullAddress: String
    
    @ObservedObject var locationManager = LocationManager.shared
    //for address input
    @State var streetAddress = ""
    @State var floorOrUnit = ""
    @State var city = ""
    @State var zipCode = ""
    
    @State var clickedConfirm = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack{
                    HStack {
                        Button(action:{
                            //close view, return to previews page
                            //add animation
                            withAnimation(.spring()){
                                showLocationRequestView.toggle()
                            }
                        }){
                            Image("chevron")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding([.top, .bottom])
                    
                    VStack{
                        //logo
                        Image("foodDelivery")
                            
                            
                        //caption
                        Text("Please provide delivery destination...")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.darkGrey)
                            .multilineTextAlignment(.center)
                            .padding()
                            .padding(.top, 40)
                        
                        //use current location button
                        Button(action: {
                            //clear manual input address
                            fullAddress = ""
                           
                            //request location from user
                            locationManager.requestLocation()
                            //show order payment user interface
                            showOrderPayment.toggle()
                        }){
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color.red)
                                Text("USE CURRENT LOCATION")
                                    .font(.subheadline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.darkGrey)
                            }
                        }
                        .padding()
                        .frame(width: getRect().width - 50)
                        .background(Color.halfColonialWhite)
                        .clipShape(Rectangle())
                        .cornerRadius(15)
                        
                        
                        
                        
                        
                        Text("OR")
                            .fontWeight(.light)
                            .padding()
                            
                        
                        
                        //enter address textfield
                        //custom text field here
                        VStack {
                            Section {
                                TextField("Floor/Unit", text: $floorOrUnit)
                                    .padding()
                                    .background(Color.grey.opacity(0.2))
                                    .cornerRadius(15)
                                    .font(.headline)
                
                                TextField("Street Address", text: $streetAddress)
                                    .padding()
                                    .background(Color.grey.opacity(0.2))
                                    .cornerRadius(15)
                                    .font(.headline)
                                
                                TextField("Zip Code", text: $zipCode)
                                    .padding()
                                    .background(Color.grey.opacity(0.2))
                                    .cornerRadius(15)
                                    .font(.headline)
                                
                                TextField("City", text: $city)
                                    .padding()
                                    .background(Color.grey.opacity(0.2))
                                    .cornerRadius(15)
                                    .font(.headline)
                                
                                Text("Fields cannot be empty")
                                    .foregroundColor(.red)
                                    .opacity(checkAddress() == false && clickedConfirm ? 1 : 0)
                                    
                                
                            }
                            .padding([.leading, .trailing], 50)
                            
                            Button(action: {
                                //clear address
                                fullAddress = ""
                                //append new address
                                fullAddress += floorOrUnit + ", "
                                fullAddress += streetAddress + ", "
                                fullAddress += zipCode + ", "
                                fullAddress += city
                                
                                if checkAddress(){
                                    showOrderPayment.toggle()
                                }else{
                                    clickedConfirm = true
                                }
                                
                            }, label: {
                                Text("Confirm")
                                    .font(.subheadline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: getRect().width - 150)
                                    .background(
                                        checkAddress() ?
                                                    LinearGradient(gradient: .init(colors: [Color.feijoa, Color.green]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) :
                                                    LinearGradient(gradient: .init(colors: [Color.grey, Color.darkGrey]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) )
                                    .cornerRadius(15)
                            })
                        }
                    }
                }
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
        }
    }
    
    func checkAddress() -> Bool {
        if streetAddress.isEmpty || floorOrUnit.isEmpty || city.isEmpty || zipCode.isEmpty {
            return false
        }
        return true
    }
    
   
    
    
    
    
    
}

struct LocationRequestView_Previews: PreviewProvider {
    @State static var showLocationRequestView = false
    @State static var showUserLocationView = false
    @State static var fullAddress = ""
    static var previews: some View {
        LocationRequestView(showLocationRequestView: $showLocationRequestView, showOrderPayment: $showUserLocationView, fullAddress: $fullAddress)
    }
}
