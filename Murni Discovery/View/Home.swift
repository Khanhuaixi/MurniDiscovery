//
//  Home.swift
//  Murni Discovery
//
//  Created by huaixi on 07/08/2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack {
            //home page content
            ScrollView(.vertical) {
                VStack{
                    HStack{
                        //add cover for home tab
                        //fit to width of screen
                        Image("Home Cover")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width, alignment: .top)
                    }
                    //"our story" view
                    OurStory()
                    //"come visit us" view
                    ComeVisitUs()
                }
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct OurStory: View {
    var body: some View {
        VStack{
            //title of this section
            Text("Our Story")
                .font(.title)
                .fontWeight(.bold)
            //icon for this section
            Image("storybook")
            
            VStack{
                //content of this section
                let story: String = "\tBeing a multicultural country, Malaysian food has acquired its very own uniqueness from the adaption of different culture’s dishes. Murni Discovery has taken this identity one step further by adapting distinctive flavour and personality from countries around the world and make them completely our own.\n\n\tSince its establishment in 1999, Murni Discovery has been introducing creativity into traditional Malaysian food without compromising the Mamak identity. Treading between traditions and innovation, we invite you to discover the symphony of flavours with us."
                
                Text(story)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .background(Color.white)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
            .frame(width: getRect().width, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .padding(.bottom, 5.0)
    }
}

struct ComeVisitUs: View {
    var body: some View {
        VStack{
            //title of this section
            Text("Come Visit Us Today!")
                .fontWeight(.bold)
                .font(.title)
            //icon of this section
            Image("visit")
            VStack{
                //content of this section
                //use tab and newline to seperate paragraphs
                let comeVisitUs: String = "\tThere are altogether 6 Murni Discovery outlets around Klang Valley area, in order to serve all the hungry eaters who are looking for a food discovery! Find out more details from OUTLETS tab.\n\n\tMake an order today from our MENU tab with a few simple steps. We’re ready to serve you our delicious food!"
                Text(comeVisitUs)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .background(Color.white)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
            .frame(width: getRect().width, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        
    }
}

