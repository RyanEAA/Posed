//
//  SinglePicCameraView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/16/23.
//

import SwiftUI
import Kingfisher

struct SinglePicCameraView: View {
    @ObservedObject var model = ViewModel()
    var pictureURL: String
    @State private var opacity = 0.5
    
    var body: some View {
        VStack{
            KFImage(URL(string: pictureURL))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .opacity(opacity)
            
            Slider(value: $opacity)
                            .padding()
        }
    }
}

struct SinglePicCameraView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePicCameraView(pictureURL: "https://firebasestorage.googleapis.com/v0/b/posed-4ac33.appspot.com/o/images%2Ffriends%2FScreenshot%202023-03-14%20at%201.44.21%20PM.png?alt=media&token=a8d034ff-87ae-4ac8-b827-a79f13f34d0a")
    }
}
