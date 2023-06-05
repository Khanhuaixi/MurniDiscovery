//
//  OutletDetail.swift
//  Murni Discovery
//
//  Created by huaixi on 07/08/2021.
//

import SwiftUI

struct OutletDetail: View {
    let oneContact: Contact
    var body: some View {
       
        VStack {
            Image(oneContact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .shadow(radius: 3 )
                
            Text(oneContact.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Form{
                outletDetail(oneContact: oneContact)
                
                contactOutlet()
            }
        }
        //80 is header height, 75 is tab bar height
        .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
    }
}

struct OutletDetail_Previews: PreviewProvider {
    static var previews: some View {
        OutletDetail(oneContact:  contact[0])
    }
}

struct outletDetail: View {
    let oneContact: Contact
    var body: some View {
        Section{
            HStack{
                Text("Phone")
                    .fontWeight(.semibold)
                Spacer()
                Text(oneContact.phone)
                    .fontWeight(.light)
                    .font(.callout)
            }
            HStack{
                Text("Email")
                    .fontWeight(.semibold)
                Spacer()
                Text(oneContact.email)
                    .fontWeight(.light)
                    .font(.callout)
            }
            HStack{
                Text("Address")
                    .fontWeight(.semibold)
                Spacer()
                Text(oneContact.address)
                    .fontWeight(.light)
                    .font(.callout)
                    .frame(width: 180)
            }
        }
        .listRowBackground(Color.pearlWhite)
    }
}

struct contactOutlet: View {
    var body: some View {
        Section{
            Button(action: {
                print("Send a message")
            }) {
                Text("Send a message")
            }
            
            Button(action: {
                print("Call")
            }) {
                Text("Call")
            }
        }
        .listRowBackground(Color.pearlWhite)
    }
}
