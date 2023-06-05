//
//  Murni_DiscoveryApp.swift
//  Murni Discovery
//
//  Created by huaixi on 22/07/2021.
//

import SwiftUI
import Firebase //connect to firebase

@main
struct Murni_DiscoveryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//connect to firebase
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //configure FirebaseApp shared instance in application:didFinishLauchingWithOptions: method
        
        //use Firebase library to configure APIs
        FirebaseApp.configure()
        return true
    }
}
