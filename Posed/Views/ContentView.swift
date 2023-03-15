//
//  ContentView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var categoryType = "friends"
    
    var body: some View {
        
                //CameraView()
        MenuView(categoryType: $categoryType)
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
