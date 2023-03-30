//
//  CardSwipingView.swift
//  Poser
//
//  Created by Ryan Aparicio on 2/21/23.
//
//https://www.youtube.com/watch?v=O2JXv9BnE70&ab_channel=Indently
import SwiftUI

import SwiftUI

struct CardSwipingView: View {
    var categoryType: String
    
    @ObservedObject var model = ViewModel()
    //@State private var showCameraView: Bool = false
    @State private var isCameraViewPresented = false

    var body: some View {
        VStack {
            ZStack {
                ForEach(model.list) { item in
                    CardView(pictureURL: item.pictureURL)
                    
                }
            }
            .onAppear {
                model.categoryType = categoryType
                model.getData()
            }
        }
    }
}

struct CardSwipingView_Previews: PreviewProvider {
    static var previews: some View {
        CardSwipingView(categoryType: "friends")
    }
}
