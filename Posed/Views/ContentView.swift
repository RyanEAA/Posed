//
//  ContentView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var categoryType = "family"
    
    var body: some View {
        
                //CameraView()
        MenuView(categoryType: self.$categoryType)
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
