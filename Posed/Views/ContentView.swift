//
//  ContentView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//

import SwiftUI
import Firebase
import Kingfisher

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        
        List(model.list){item in
            Text(item.name)
            
            Text(item.notes)
            
            KFImage(URL(string: item.pictureURl))
            //KFImage(URL(string: item.notes))
        }
        
    }
    
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
