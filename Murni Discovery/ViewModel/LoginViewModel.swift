//
//  LoginViewModel.swift
//  Murni Discovery
//
//  Created by huaixi on 18/09/2021.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    //login
    @Published var email = ""//empty input as default
    @Published var password = ""
    
    //forget password
    //reset password link
    @Published var isLinkSent = false

    //register
    @Published var isRegister = false
    
    //login error alerts
    @Published var alert = false
    @Published var alertMessage = "" //empty alert string as default
    
    //user status
    @AppStorage("log_Status") var status = false
    
    
    
    //create alertview with textfield for resetting password
    func resetPassword(){
        let alert = UIAlertController(title: "Reset Password", message: "Please enter your account email to reset password", preferredStyle: .alert)
        
        alert.addTextField{ (password) in
            password.placeholder = "Email"
        }
        
        let proceed = UIAlertAction(title: "Reset", style:  .default) { (_) in
            //self.resetEmail = alert.textFields![0].text!
            //presenting alert when email link has been sent to inbox
            //self.isLinkSend.toggle()
            //send reset password link
            if !alert.textFields![0].text!.isEmpty{

                
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!){ //use ! to force unwrap
                    (error) in
                    

                    
                    if error != nil {
                        self.alertMessage = error!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    //alert user
                    self.alertMessage = "Password rest link has been sent to your email inbox. Please click the link to reset password."
                    self.alert.toggle() //trigger to show error dialog
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        //presenting
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    //for login authentication
    func login(){
        //email and password textfield cannot be empty/blank
        if email.isEmpty || password.isEmpty{
            self.alertMessage = "Email and password cannot be empty"
            self.alert.toggle()
            return //get out from this function
        }
        

        
        //get input from email and password textfield when need to login
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            

            
            if error != nil{
                //assign customized error description to alertMessage
                self.alertMessage = error!.localizedDescription
                //toggle alert boolean variable to true
                self.alert.toggle()
                return
            }
            //check if user email is verified and in firebase or not
            let user = Auth.auth().currentUser //return cached current logged in user of app
            //if not verified yet
            if !user!.isEmailVerified{
                self.alertMessage = "Please verify your email before login"
                self.alert.toggle()
                //sign out
                try! Auth.auth().signOut()
                
                return
            }
            
            //if no errors and user email is already verified, then set user status to true
            withAnimation{
                //self.status = true
                self.status.toggle()
            }
            
        }
    }
    

    
    //log out from account
    func logOut(){
        try! Auth.auth().signOut()
        withAnimation{
            self.status = false
        }
    }
    
    
    
}

