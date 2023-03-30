//
//  ItemView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/13/23.
//

import Foundation
import SwiftUI

struct ItemView: View{
    
    let item: Item
    
    var body: some View{
        
        GeometryReader{ reader in
            
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(50, reader.size.width * 0.6)
            
            VStack(spacing: 5){
                Image(systemName: item.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.imgColor)
                    .rotation3DEffect(.degrees(15), axis: (x: 0, y: 1, z: 0)) // Add this line for 3D effect
                    .frame(width: imageWidth)
                
                Text(item.title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }
        .frame(height: 150)
        
    }
    
}
