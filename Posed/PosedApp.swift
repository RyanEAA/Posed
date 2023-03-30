//
//  PosedApp.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//

import SwiftUI
import Firebase

@main
struct PosedApp: App {
    
    
    //app delegate adaptor is our AppDelegate and it's being held in the appDelegate instance
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    

    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
        
    }
}
