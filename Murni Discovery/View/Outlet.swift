//
//  Outlet.swift
//  Murni Discovery
//
//  Created by huaixi on 07/08/2021.
//

import SwiftUI

struct Outlet: View {
    //step 1: list
    //step 2: navigation view
    //step 3: navigation link
    var body: some View {
        VStack {
            NavigationView {
                //List takes an Identifible Collection of Data
                //and a closure, which represents row view of data collection
                
                //contacts is identifiable collection of data
                List(contact){ oneContact in
                    NavigationLink(
                        destination:
                            OutletDetail(oneContact: oneContact)) {
                            ContactRow(oneContact: oneContact)
                    }
                }
                //hide navigation bar title
                .navigationBarHidden(true)
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
            
        }
    }
}

struct Outlet_Previews: PreviewProvider {
    static var previews: some View {
        Outlet()
    }
}

struct ContactRow: View {
    //above body
    let oneContact: Contact

    var body: some View {
        HStack {
            VStack{
                Image(oneContact.imageName)
                    .resizable()
                    .frame(width: getRect().width - 70, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(10.0)
                
                VStack {
                    Text(oneContact.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(oneContact.address)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .frame(width: getRect().width - 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.pearlWhite)
                .shadow(radius: 10)
            }
            .padding()
        }
    }
}
