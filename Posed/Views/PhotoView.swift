//
//  PhotoView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/14/23.
//

import SwiftUI
import Firebase
import Kingfisher

struct PhotoView: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        
        VStack{
            List(model.list){item in

                KFImage(URL(string: item.pictureURl))
                
                

            }
            
            Button(action: {
                
                print(model.categoryType)
                
                
            }) {
                
                Text("\(model.categoryType)")
                
            }
        }

    }
    
    init() {
        model.getData()
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
