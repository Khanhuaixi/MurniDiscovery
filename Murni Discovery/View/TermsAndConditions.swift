//
//  TermsAndConditions.swift
//  Murni Discovery
//
//  Created by huaixi on 18/09/2021.
//

import SwiftUI

struct TermsAndConditions: View{
    
    @ObservedObject var model: RegisterViewModel
    var body: some View{
        ScrollView {
            VStack{
                
                HStack{
                    Button(action:{
                        //close view, return to login page
                        //add animation
                        withAnimation(.spring()){
                            model.isViewTermsAndConditions.toggle()}
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
                    
                    Text("TERMS AND CONDITIONS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.darkGrey)
                }
                Divider()
                
                Text("\tThese Terms of Use (“Terms”) govern your use of the websites and mobile applications provided by foodpanda (or referred to as “us”) (collectively the “Platforms”). Please read these Terms carefully. By accessing and using the Platforms, you agree that you have read, understood and accepted the Terms including any additional terms and conditions and any policies referenced herein, available on the Platforms or available by hyperlink. If you do not agree or fall within the Terms, please do not use the Platforms.\n\n\tThe Platforms may be used by (i) natural persons who have reached 18 years of age and (ii) corporate legal entities, e.g companies. Where applicable, these Terms shall be subject to country-specific provisions as set out herein.\n\n\tUsers below the age of 18 must obtain consent from parent(s) or legal guardian(s), who by accepting these Terms shall agree to take responsibility for your actions and any charges associated with your use of the Platforms and/or purchase of Goods. If you do not have consent from your parent(s) or legal guardian(s), you must stop using/accessing the Platforms immediately.\n\n\tMurni Discovery reserves the right to change or modify these Terms (including our policies which are incorporated into these Terms) at any time. You are strongly recommended to read these Terms regularly. You will be deemed to have agreed to the amended Terms by your continued use of the Platforms following the date on which the amended Terms are posted.")
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}
struct TermsAndConditions_Previews: PreviewProvider {
    @StateObject static var model = RegisterViewModel()
    static var previews: some View {
        TermsAndConditions(model: model)
    }
}
