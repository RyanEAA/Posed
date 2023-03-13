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
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
