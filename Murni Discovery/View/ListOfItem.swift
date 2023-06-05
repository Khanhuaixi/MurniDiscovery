//
//  ListOfItem.swift
//  Murni Discovery
//
//  Created by huaixi on 11/09/2021.
//

import SwiftUI

struct ListOfItem: View {
    @Binding var showItemList: Bool
    @Binding var selectedCategory: Category
    //When the state value changes, the view invalidates its appearance and recomputes the body
    @Binding var showItemDetail: Bool
    //default as localFlavours[0]
    @State var selectedItem: Item = localFlavours[0]
    
    
    var body: some View {
        VStack {
            ScrollView{
                HStack {
                    Button(action:{
                        //close view, return to previews page
                        //add animation
                        withAnimation(.spring()){
                            showItemList.toggle()
                        }
                    }){
                        Image("chevron")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                VStack{
                    //spacing between grids and number of grids in one row
                    //and also spacing between rows
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing: 30){
                        
                        ForEach(selectedCategory.categoryCollection){item in
                            //card view here
                            ItemCardView(item: item)
                                //after tapping on a card
                                .onTapGesture {
                                    //add animation
                                    withAnimation(.spring()){
                                        //update selected local flavours
                                        selectedItem = item
                                        //change (toggle) boolean value
                                        showItemDetail.toggle()
                                    }
                                }
                        }
                    }
                }
            }
            .padding()
            //80 is header height, 75 is tab bar height
            .frame(maxHeight: getRect().height - (80 + 75), alignment: .center)
        }
        //make this ui invisible of showItemDetail is true
        .opacity(showItemDetail ? 0 : 1)
        
        //call ItemDetail id showItemDetail is true
        if showItemDetail {
            ItemDetail(showItemDetail: $showItemDetail, selectedItem: $selectedItem)
        }
    }
}

struct ListOfItem_Previews: PreviewProvider {
    @State static var showItemList = false
    @State static var selectedCategory: Category = category.first!
    @State static var showItemDetail = false
    static var previews: some View {
        ListOfItem(showItemList: $showItemList, selectedCategory: $selectedCategory, showItemDetail: $showItemDetail)
    }
}

