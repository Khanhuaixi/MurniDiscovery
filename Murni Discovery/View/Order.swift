//
//  Order.swift
//  Murni Discovery
//
//  Created by huaixi on 09/09/2021.
//

import SwiftUI
import AVFoundation //for playing sound effect
import Firebase

struct Order: View {
    @Binding var showLocationRequestView: Bool
    @Binding var showOrderPayment: Bool
    @Binding var fullAddress: String
    @StateObject var order = OrderViewModel()
    @State var soundEffectPlayer: AVAudioPlayer!
    @State var totalPayment = ""

    var body: some View {

        ZStack {
            VStack{
                VStack{
                    if (order.orderData.count != 0) {
                        //list is scrollable therefore no need ScrollView()
                        List{
                            ForEach(order.orderData.indices, id: \.self){ index in
                                //only show order by the logged in user
                                //check using email
                                //all user has unique email
                                if order.orderData[index].userEmail == Auth.auth().currentUser?.email ?? "" {
                                    HStack {
                                        OrderItemView(orderItem: $order.orderData[index], orderItems: $order.orderData)
                                    }
                                    .onTapGesture{
                                        //present alert view to input new quantity
                                        UIApplication.shared.windows.last?
                                            .rootViewController?
                                            .present(textFieldAlertView(id: order.orderData[index].id), animated: true, completion: nil)
                                    }
                                }
                            }
                            .onDelete{ index in
                                //delete item from order
                                let database = Firestore.firestore()
                                database.collection("order").document(self.order.orderData[index.last!].id).delete {
                                    error in

                                    if error != nil{
                                        print((error?.localizedDescription)!)
                                        return
                                    }
                                    self.order.orderData.remove(atOffsets: index)
                                }
                            }
                            .padding(.init(top: 5, leading: 5, bottom: 0, trailing: 5))
                        }
                    }
                }
                
                //bottom view
                VStack{
                    //show total price of order
                    HStack{
                        //total label
                        Text("Total")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                        //push total price to most right side
                        Spacer()

                        //total price here
                        //call function to calculate total price of order
                        Text(calculateTotalPrice())
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                    }
                    .padding(.horizontal)

                    Button(action: {
                        //update total payment when check out
                        self.totalPayment = calculateTotalPrice()
                        //play sound effect
                        soundEffectPlayer.play()
                        //show request location view
                        showLocationRequestView.toggle()
                    }){
                        Text("Check Out")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: getRect().width - 30, alignment: .top)
                            .background(
                                //gradient color for this button
                                //from left to right(leading to trailing)
                                
                                calculateTotalPrice() == "$0.00" ?
                                            LinearGradient(gradient: .init(colors: [Color.grey, Color.darkGrey]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) :
                                            LinearGradient(gradient: .init(colors: [Color.feijoa, Color.green]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) )
                            .cornerRadius(15)
                        
                        
                    }
                    .disabled(calculateTotalPrice() == "$0.00" ? true : false)
                }
               
            }
            //80 is header height, 75 is tab bar height
            .frame(maxWidth: getRect().width, maxHeight: getRect().height - (80 + 75), alignment: .center)
            //when this view appears on screen
            .onAppear {
                //load when vstack appear
                let soundEffectUrl = Bundle.main.path(forResource: "Success", ofType: "wav")
                self.soundEffectPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundEffectUrl!))
            }
            .opacity(showLocationRequestView || showOrderPayment ? 0 : 1)
            
            if showLocationRequestView && showOrderPayment {
                OrderPayment(showOrderPayment: $showOrderPayment, fullAddress: $fullAddress, totalPayment: $totalPayment)
            }else if showLocationRequestView && showOrderPayment == false {
                LocationRequestView(showLocationRequestView: $showLocationRequestView, showOrderPayment: $showOrderPayment, fullAddress: $fullAddress)
            }
        }
    }
    //get order item index
    func getIndex(orderItem: OrderItem) -> Int {
        return order.orderData.firstIndex{ (item1) -> Bool in
            return orderItem.id == item1.id
        } ?? 0
    }
    
    //calculate total price of whole order
    func calculateTotalPrice() -> String {
        //set 0 as default
        var totalFoodPrice: Float = 0
        //loop through each order item
        order.orderData.forEach{ (orderItem) in
            if orderItem.userEmail == Auth.auth().currentUser?.email ?? ""{
                //quantity multiply unit price and add to total price
                totalFoodPrice += Float(truncating: orderItem.itemQuantity) * orderItem.itemPrice
            }
        }
        return getPrice(value: totalFoodPrice)
    }
    
}


func textFieldAlertView(id: String) -> UIAlertController{
    //alert window title, message
    let alert = UIAlertController(title: "Update", message: "Enter quantity", preferredStyle: .alert)

    //create update option
    let update = UIAlertAction(title: "Update", style: .default){
        (_) in
        
        let database = Firestore.firestore()
        let value = alert.textFields![0].text!
        
        //update the itemQuantity in Firestore of the order item
        database.collection("order").document(id).updateData(
            [AnyHashable("itemQuantity"): Int(value)!]) { error in
            if error != nil{
                print((error?.localizedDescription)!)
                return
            }
            
        }
    }
    //create cancel button action
    let cancel = UIAlertAction(title: "Cancel", style: .destructive,
                               handler: nil)
    
    //disable as default, since textfield is empty at the beginning
    update.isEnabled = false
    
    //add action listener
    alert.addAction(update)
    alert.addAction(cancel)
    
    //add text field to alert view
    alert.addTextField { (textInput) in
        textInput.placeholder = "Quantity"
        //avoid negative quantity input from user
        textInput.keyboardType = .numberPad
        //handle empty input
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textInput, queue: OperationQueue.main, using: {_ in
            //enter this block when UITextField.textDidChangeNotification is fired
            
            //access 'textInput' object from 'alert.addTextField'
            //get character count in textfield after trimming white space
            let textCount = textInput.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
            //if 'textCount' is > 0, will be 'textIsNotEmpty' boolean variable will be true
            let textIsNotEmpty = textCount > 0
            
            //if 'textIsNotEmpty' is true, enable update button
            update.isEnabled = textIsNotEmpty
        })
    }
    return alert
}

struct Order_Previews: PreviewProvider {
    @State static var showLocationRequestView = false
    @State static var showUserLocationView = false
    @State static var fullAddress = ""
    static var previews: some View {
        Order(showLocationRequestView: $showLocationRequestView, showOrderPayment: $showUserLocationView, fullAddress: $fullAddress)
    }
}
