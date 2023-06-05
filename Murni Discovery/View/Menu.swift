//
//  Menu.swift
//  Murni Discovery
//
//  Created by huaixi on 22/07/2021.
//
//kept as singular noun
import SwiftUI

struct Menu: View {
    @Binding var showItemList: Bool
    @Binding var showItemDetail: Bool
    //set default first clicked category to 'Local Flavours'
        //'first' indicate first item in collection (dictionary)
    //observer = Keep checking state value of variable 'selectedCategory'
        //which allows interactive control
        //must declare outside body
    @State var selectedCategory: Category = category.first!
    
    var body: some View {
        
        ZStack {
            VStack {
                ScrollView(.vertical){
                    VStack{
                        //Top view
                        HStack{
                            TopView()
                        }
                        //'Categories' title
                        CategoryTitle()
                        //use $ when passing an argument which is an observer
                        CategoryScrollView(showItemList: $showItemList, selectedCategory: $selectedCategory)
                        //'Top Picks' title
                        TopPickTitle()
                        //show top picks in scroll view
                        TopPickScrollView()
                    }
                }
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
            //opacity 0 will make this view invisible, opacity 1 will stay completely visible
            .opacity(showItemList ? 0 : 1)
            
            //if showItemList is true, menu will become invisible and item list of selected category will show
            if showItemList {
                ListOfItem(showItemList: $showItemList, selectedCategory: $selectedCategory, showItemDetail: $showItemDetail)
            }
        }
    }
}
    
//preview menu interface
struct Menu_Previews: PreviewProvider {
    @State static var showItemList = false
    @State static var showItemDetail = false
    static var previews: some View {
        Menu(showItemList:  $showItemList, showItemDetail: $showItemDetail)
    }
}

//extend view to get screen frame
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

//top view contains the cover photo and the title overlaid on the cover photo
struct TopView: View {
    var body: some View {
        Image("Top Cover")
            .resizable()
            //resolution of image
            .aspectRatio(contentMode: .fit)
            //height and width, allocate how many space
            .frame(width: getRect().width, alignment: .top)
            .overlay(TopViewOverlay(), alignment: .center)
    }
}

//title which overlays the cover of menu
struct TopViewOverlay: View{
    var body: some View{
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            //title for top cover
            (//add text//use custom color
            Text("Discover ")
                //modifier
                .foregroundColor(.gold)
                    +
            Text("Delicious Food")
            )
            //modifiers
            //set font and bold
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(5)
            .background(Color.white)
            .cornerRadius(15)
            .padding(10)
            
        })
    }
}

struct CategoryTitle: View {
    var body: some View {
        Text("Categories")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.horizontal)
    }
}

//categories can be scrolled to let user view and select
struct CategoryScrollView: View {
    //Observable variables
    @Binding var showItemList: Bool
    @Binding var selectedCategory: Category
    var body: some View {
        //use horizontal scroll view
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 15){
                //first 'category' is a dictionary
                //second 'category' act as indexing variable
                ForEach(category){ category in
                    HStack(spacing: 10){
                        //icon on the left
                        Image(category.categoryIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .background(selectedCategory.id == category.id ? Color.pearlWhite : Color.clear)
                            .clipShape(Circle())
                        
                        //name of category on the right
                        Text(category.categoryName)
                            .fontWeight(.bold)
                            .foregroundColor(selectedCategory.id == category.id ? .pearlWhite : .darkGrey)
                    }
                    //for each category
                    //padding before background change
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(selectedCategory.id == category.id ? Color.orange : Color.gold.opacity(0.5))
                    //capsule shape used
                    .clipShape(Capsule())
                    .padding(.horizontal, 5)
                    //add shadow behind button
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    //when category is tapped
                    .onTapGesture {
                        //add spring animation to selected category ('selectedCategory')
                        //assign index variable 'category' to 'selectedCategory'
                        withAnimation(.spring()){
                            selectedCategory = category
                        }
                        //delay 0.3s, wait for animation to end
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            //toggle to show item list of selected category
                            showItemList.toggle()
                        }
                    }
                }
            }
            
        })
        
    }
    
}

struct TopPickTitle: View {
    var body: some View {
        Text("Top Picks Gallery")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.horizontal)
    }
}

struct TopPickScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 25){
                ForEach(topPicksGallery) { topPick in
                    VStack(spacing: 5){
                        //medal on the right
                        Image(topPick.medal)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(5)
                            .background(Color.gold)
                            .clipShape(Circle())
                            .padding(.top, 10)
                        
                        Image(topPick.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
                            .padding(.horizontal, 6)
                        
                        //name of top pick food below
                        Text(topPick.name)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                        
                        Text(topPick.price)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                            .padding(.bottom, 10)
                    }
                    .background(Color.pearlWhite)
                    .cornerRadius(12)
                }
            }
            .padding()
        })
        .padding(.top, 1)
    }
}






