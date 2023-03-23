//
//  CardView.swift
//  Poser
//
//  Created by Ryan Aparicio on 2/21/23.
//
import SwiftUI
import Kingfisher

struct CardView: View {
    
    var pictureURL: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    @State private var isCameraViewPresented = false // Add this state to manage sheet presentation

    var body: some View {
        ZStack{
            KFImage(URL(string: pictureURL))
                .resizable()
                .frame(width: 310, height: 410)
                .scaledToFit()
            Rectangle()
                .frame(width: 320, height: 420)
                .border(.white, width: 6.0)
                .cornerRadius(4)
                .foregroundColor(color.opacity(0.2))
                .shadow(radius: 5)
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees((Double(offset.width / 40))))
        .gesture(
            TapGesture()
                .onEnded {
                    print("\(pictureURL)")
                    isCameraViewPresented = true // Set isCameraViewPresented to true when tapped
                }
                .simultaneously(with: DragGesture().onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                } .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                })
        )
        .sheet(isPresented: $isCameraViewPresented) {
            CameraView(pictureURL: pictureURL)
        }
        
        
    }
    
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150): //swiped to left
            print("pictureURL removed")
            offset = CGSize(width: -500, height: 0)//sends card to left
        case 150...(500)://swiped to right
            print("pictureURL added")
            offset = CGSize(width: 500, height: 0)//sends card to right
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat){
        switch width{
        case -500...(-130):// if card is on left it changes color to red
            color = .red
        case 130...(500): //if card is on right it changes color to green
            color = .green
        default:
            color = .black
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(pictureURL: "https://firebasestorage.googleapis.com/v0/b/posed-4ac33.appspot.com/o/images%2Ffriends%2FScreenshot%202023-03-14%20at%201.44.21%20PM.png?alt=media&token=a8d034ff-87ae-4ac8-b827-a79f13f34d0a")
    }
}
