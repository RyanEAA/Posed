//
//  ContentView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var categoryType = "friends"
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn{

                NavigationLink(destination: MenuView(categoryType: $categoryType)) {
                    Text("Thank You!")
                    Text("Enjoy the Show!")
                }
                
            }
            else{
                SignInView()
            }
            
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedin
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
