//
//  CustomTextField.swift
//  Murni Discovery
//
//  Created by huaixi on 18/09/2021.
//

import SwiftUI
struct CustomTextField: View{
    var icon: String
    var placeHolder: String
    @Binding var inputText: String
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            //icon of textfield
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(Color.black)
                .frame(width: 60, height: 60)
                
            ZStack{
                if placeHolder == "Password" || placeHolder == "Confirm Password" {
                    //private text for password text field
                    SecureField(placeHolder, text: $inputText)
                        //do not autocapitalize and autocorrect
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }else{
                    TextField(placeHolder, text: $inputText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            }
            .padding(.horizontal)
            .padding(.leading, 65)
            .frame(height: 60)
            .background(Color.gold.opacity(0.3))
            .clipShape(Capsule())
            .overlay(
                Capsule() //border line around text field, with width of 2
                    .stroke(Color.darkGrey.opacity(0.5), lineWidth: 2)
            )
        }
        .padding()
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @ObservedObject static var model = LoginViewModel()
    static var previews: some View {
        CustomTextField(icon: "person", placeHolder: "Email", inputText: $model.email)
    }
}
