//
//  PhotoAndCameraView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/20/23.
//

import SwiftUI

struct PhotoAndCameraView: View {
    var categoryType: String
    //@Binding var showCamera: Bool
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        //NavigationView {
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
        //}
    }
}

struct PhotoAndCameraView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoAndCameraView(categoryType: "friends")
    }
}
