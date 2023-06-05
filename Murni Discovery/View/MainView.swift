//
//  MainView.swift
//  Murni Discovery
//
//  Created by huaixi on 10/09/2021.
//

import SwiftUI

struct MainView: View {
    @State var showItemList = false
    @State var showItemDetail = false
    @State var showLocationRequestView = false
    @State var showOrderPayment = false
    @State var fullAddress = ""
    
    @State var selectedCategory: Category = category.first!
    @State var currentTab: TabEnum = .Menu

    
    init(size: CGSize, bottomEdge: CGFloat){
        self.size = size
        self.bottomEdge = bottomEdge
        //hide original(native) tab view
        UITabBar.appearance().isHidden = true
    }
    //animation for tab view
    @Namespace var animation
    var size: CGSize
    var bottomEdge: CGFloat
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .center) {
                    Image("murniDiscoveryLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(maxWidth: getRect().width, maxHeight: 80)
            }
            VStack{
                //is a native tab view
                TabView(selection: $currentTab){
                    //different tab views
                    Home()
                        .tag(TabEnum.Home)
                    Menu(showItemList: $showItemList, showItemDetail: $showItemDetail)
                        .tag(TabEnum.Menu)
                    Order(showLocationRequestView: $showLocationRequestView, showOrderPayment: $showOrderPayment, fullAddress: $fullAddress)
                        .tag(TabEnum.Order)
                    Outlet()
                        .tag(TabEnum.Outlets)
                    Settings()
                        .tag(TabEnum.Settings)
                }
                //75 is tab bar height
                .frame(maxWidth: getRect().width, maxHeight: getRect().height - 75, alignment: .center)
            }
            
            //custom tab view here
            CustomTabBar(animation: animation, size: size, bottomEdge:  bottomEdge, currentTab: $currentTab)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum TabEnum: String, CaseIterable{
    case Home //will return case name as constant String, exp: return "Home"
    case Menu
    case Order
    case Outlets
    case Settings
}


