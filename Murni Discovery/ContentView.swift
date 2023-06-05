//
//  ContentView.swift
//  Murni Discovery
//
//  Created by huaixi on 10/09/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    //own this 'model' object in ContentView
    @StateObject var model = LoginViewModel()
    
    var body: some View {
        
        ZStack{
            //if already logged in, status will be true
            if status{
                //show main view
                GeometryReader{proxy in
                    let size = proxy.size
                    let bottomEdge = proxy.safeAreaInsets.bottom

                    MainView(size: size, bottomEdge: bottomEdge)
                        .ignoresSafeArea(.all, edges: .bottom)
                }

            }else{
                //show login if not logged in yet
                Login(loginData: model)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








