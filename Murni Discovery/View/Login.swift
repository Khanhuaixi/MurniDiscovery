//
//  Login.swift
//  Murni Discovery
//
//  Created by huaixi on 18/09/2021.
//

import SwiftUI

struct Login: View {
    //watch object for changes
    @StateObject var loginData = LoginViewModel()
    
    var body: some View{
        
        ScrollView {
            VStack{
                VStack {
                    Image("murniDiscoveryLogo")
                        .resizable()
                        .frame(width: 200, height: 120, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 80)

                    Text("LOGIN")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.darkGrey)
                }
                .padding(.top, 50)
                Divider()
                VStack{
                    VStack(spacing: 10){
                        CustomTextField(icon: "person", placeHolder: "Email", inputText: $loginData.email)
                        
                        CustomTextField(icon: "key", placeHolder: "Password", inputText: $loginData.password)
                        
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.darkGrey.opacity(0.5), lineWidth: 2)
                )
                .padding()
                
                Button(action: {loginData.login()}){
                    
                    HStack {
                        Image("rectangle.portrait.and.arrow.right")
                        
                        Text("LOGIN")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(width: getRect().width - 30)
                    .background(
                        //gradient color for this button
                        //from left to right(leading to trailing)
                        LinearGradient(gradient: .init(colors: [Color.halfColonialWhite, Color.gold]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .cornerRadius(15)
                    
                }
                .padding([.top, .leading, .trailing])
                .foregroundColor(Color.white)
                Button(action: {loginData.resetPassword()}){
                    Text("Forget Password?")
                        .foregroundColor(Color.darkGrey)
                }
                
                Button(action: {
                    //toggle false to true
                    loginData.isRegister.toggle()
                }){
                    Text("Don't have an account yet?\nRegister now")
                        .foregroundColor(Color.darkGrey)
                        .multilineTextAlignment(.center)
                        
                }
                .padding(.top, 50)
                
            }
            .background(Color.white)
            .alert(isPresented: $loginData.isLinkSent) {
                Alert(title: Text("Message"), message: Text("Password Reset Link Has Been Sent To Your Inbox"), dismissButton: .destructive(Text("Ok")))
            }
            //present alert message
            .alert(isPresented: $loginData.alert, content: {
                Alert(title: Text("Message"), message: Text(loginData.alertMessage), dismissButton: .destructive(Text("Ok")))
            })
            //present register ui if isRegister is true
            .fullScreenCover(isPresented: $loginData.isRegister) {
                Register(loginData: loginData)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
