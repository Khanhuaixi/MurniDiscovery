//
//  Settings.swift
//  Murni Discovery
//
//  Created by huaixi on 18/09/2021.
//

import SwiftUI
import Firebase

struct Settings: View{
    @AppStorage("log_Status") var status = false
    //own this 'model' object in ContentView
    @StateObject var model = LoginViewModel()
    
    var body: some View{
//        if status is true
//        show logged in successfuly
        ZStack {
            VStack(spacing: 25){
                ScrollView{
                    VStack(alignment: .center){
                        Text("Logged In As \(Auth.auth().currentUser?.email ?? "")")
                        //log out option
                        Button(action: {
                                model.logOut()
                        }, label: {
                            Text("Log Out")
                                .fontWeight(.bold)
                        })
                    }
                    .padding(.top, 100)
                }
            }
        }
    }
    
    
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
