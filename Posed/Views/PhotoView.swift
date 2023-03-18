//
//  PhotoView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/14/23.
//

import SwiftUI
import Firebase
import Kingfisher

////not used

struct PhotoView: View {
    @ObservedObject var model = ViewModel()
    var categoryType: String
    
    
    //@State private var selectedPhoto: Picture?
    
    var body: some View {
        List(model.list) { item in
            NavigationLink(destination: CameraView(pictureURL: item.pictureURL)) {
                KFImage(URL(string: item.pictureURL))
                    .resizable()
            }
        }
        .onAppear {
            model.categoryType = categoryType
            model.getData()
        }
    }
    
    
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(categoryType: "friends")
    }
}
