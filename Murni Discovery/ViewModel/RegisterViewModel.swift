//
//  RegisterViewModel.swift
//  Murni Discovery
//
//  Created by huaixi on 19/09/2021.
//

import SwiftUI
import Firebase

class RegisterViewModel: ObservableObject{
    //register
    @Published var isRegister = false
    @Published var emailRegister = ""
    @Published var passwordRegister = ""
    @Published var confirmPasswordRegister = ""
    
    //view terms and conditions
    @Published var isViewTermsAndConditions = false
    
    //login error alerts
    @Published var alert = false
    @Published var alertMessage = "" //empty alert string as default
    
    //reference to firestore database
    let ref = Firestore.firestore()
    
    //add new account to firebase
    //and also write to firestore database
    func register(){
        if emailRegister.isEmpty || passwordRegister.isEmpty || confirmPasswordRegister.isEmpty {
            //update alert message
            self.alertMessage = "Email and password cannot be blank"
            //toggle to true, trigger to show alert message
            self.alert.toggle()
            return
        }
        
        if passwordRegister != confirmPasswordRegister{
            self.alertMessage = "Password does not match"
            self.alert.toggle()
            return
        }

//        let uid = Auth.auth().currentUser!.uid
        // get input from email and password textfield when user wants to create new account = register
        Auth.auth().createUser(withEmail: emailRegister, password: passwordRegister){
            (result, error) in
            
            
            if error != nil{
                self.alertMessage = error!.localizedDescription
                self.alert.toggle()
                return
            }
            //send verification link to email inbox to let user verify account
            result?.user.sendEmailVerification(completion: { (error) in
                if error != nil{
                    self.alertMessage = error!.localizedDescription
                    self.alert.toggle()
                    return //return statement is optional because return void
                }
                //alert user to verify account using the link sent to email inbox
                self.alertMessage = "Email verification link has been sent to your email inbox. Please click the link to verify your account."
                self.alert.toggle()
                
            })
            
        }
        
    }

}

