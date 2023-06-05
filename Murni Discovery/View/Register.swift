//
//  Register.swift
//  Murni Discovery
//
//  Created by huaixi on 19/09/2021.
//

import SwiftUI

struct Register: View{
    
    @StateObject var model = RegisterViewModel()
    @ObservedObject var loginData: LoginViewModel
    var body: some View{
        ScrollView {
            VStack{
                HStack{
                    Button(action:{
                        //close view, return to login page
                        //add animation
                        withAnimation(.spring()){
                            loginData.isRegister.toggle()}
                    }){
                        Image("chevron")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }

                
                VStack {
                    Image("murniDiscoveryLogo")
                        .resizable()
                        .frame(width: 200, height: 120, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 80)
                    
                    Text("REGISTER")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.darkGrey)
                }
                Divider()
                VStack(spacing: 20){
                    CustomTextField(icon: "person", placeHolder: "Email", inputText: $model.emailRegister)
                    
                    CustomTextField(icon: "key", placeHolder: "Password", inputText: $model.passwordRegister)
                    
                    CustomTextField(icon: "key", placeHolder: "Confirm Password", inputText: $model.confirmPasswordRegister)
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.darkGrey.opacity(0.5), lineWidth: 2)
                )
                .padding()
                
                Button(action: {model.register()}){
                    HStack {
                        Image(systemName: "person.badge.plus")
                        
                        Text("REGISTER")
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: getRect().width - 30)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color.halfColonialWhite, Color.gold]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .cornerRadius(15)
                }
                .padding([.top, .leading])
                
                VStack(alignment: .center){
                    Text("By logging into or creating an account, you are agreeing with our")
                        .fontWeight(.thin)
                        .foregroundColor(Color.darkGrey)
                        .multilineTextAlignment(.center)
                        
                    Button(action: {
                        model.isViewTermsAndConditions.toggle()
                    }){
                        Text("Terms and Conditions")
                            .fontWeight(.thin)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 45)
                
                Spacer()

            }
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Message"), message: Text(model.alertMessage), dismissButton: .destructive(Text("Ok"), action: {
                    //if email verification link has been sent to inbox, close the register view
                    if model.alertMessage == "Email verification link has been sent to your email inbox. Please click the link to verify your account."{
                        //set to false to trigger register view to be closed
                        model.isRegister.toggle()
                        //empty textfield
                        model.emailRegister = ""
                        model.passwordRegister = ""
                        model.confirmPasswordRegister = ""
                    }
                    
                    
                }))
            })
            .fullScreenCover(isPresented: $model.isViewTermsAndConditions){
                TermsAndConditions(model: model)
            }
            .padding()
        }
    }
}

struct Register_Previews: PreviewProvider {
    @StateObject static var model = RegisterViewModel()
    @ObservedObject static var loginData = LoginViewModel()
    static var previews: some View {
        Register(model: model, loginData: loginData)
    }
}
