//
//  CustomTabBar.swift
//  Murni Discovery
//
//  Created by huaixi on 10/09/2021.
//

import SwiftUI

struct CustomTabBar: View {
    var animation: Namespace.ID
    
    //extract screen size and bottom safe area
    var size: CGSize
    var bottomEdge: CGFloat
    
    //live update using binding
    @Binding var currentTab: TabEnum
    
    //add animation (shape shrink action)
    @State var startAnimation: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                //tab buttons
                //loop through enum from TabEnum
                ForEach(TabEnum.allCases, id: \.rawValue){tab in
                    TabButton(tab: tab, animation: animation, currentTab: $currentTab) {
                        pressedTab in
                        //update tab
                        //add animation when switching tab
                        withAnimation(.spring()){
                            startAnimation = true
                        }
                        //animation start after switching tabs
                        //with delay 0.15s
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                                currentTab = pressedTab
                            }
                        }
                        //after tab animation finished and after 0.30s, reset main animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30){
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                                startAnimation = false
                            }
                        }
                    }
                }
            }
            //elastic shape in tab bar
            .background(
                ZStack{
                    //rectangle shape with custom color
                    Rectangle()
                        .fill(Color.halfColonialWhite)
                        //same width and height as button
                        .frame(width: 60, height: 60)
                        .offset(y: 40)
                    //overlap two white circle beside the rectangle shape
                    //same color as tab bar
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        //check 'startAnimation' boolean value to start animation, start movement
                        .offset(x: (startAnimation ? 20 : 35), y: 40)
                        .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .offset(x: (startAnimation ? -20 : -35), y: 40)
                        .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                }
                .offset(x: getStartOffset())
                .offset(x: getOffset())
                ,alignment: .leading
            )
            .padding(.horizontal)
            .padding(.bottom, bottomEdge == 0 ? 15 : bottomEdge)
        }
    }
    func getStartOffset() -> CGFloat{
        //5 is the number of tabs in total
        let reduced = (size.width - 50) / 5
        //60 is button size
        let center = (reduced - 60) / 2
        return center
    }
    
    func getOffset() -> CGFloat{
        //5 is the number of tabs in total
        let reduced = (size.width - 30) / 5
        let index = TabEnum.allCases.firstIndex{ checkTab in
            return checkTab == currentTab
        } ?? 0
        
        return reduced * CGFloat(index)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TabButton: View {
    var tab: TabEnum
    var animation: Namespace.ID
    //live update using @Binding
    @Binding var currentTab: TabEnum
    //send back results
    var onTap: (TabEnum) -> ()
    
    var body: some View{
            
        VStack {
            //icon of each tab bar button
            Image(tab.rawValue)
            //use 60 by 60 as size of tab button
            .frame(width: 60, height: 60)
        }
        .background(
            //add circle behind each tab bar button
            ZStack{
                if currentTab == tab{
                    //custom color if is current tab, to highlight the current tab bar button
                    Circle()
                        .fill(Color.halfColonialWhite)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
        )
        .overlay(
            //add title of each tab
            Text(tab.rawValue)
                //font size 16 and add top padding
                .font(.system(size: 16))
                .padding(.top, 75)
        )
        //fill whole rectangle tab bar to width of screen
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(tab)
        }
        
    }
}
