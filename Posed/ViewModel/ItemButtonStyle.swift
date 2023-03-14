//
//  ItemButtonStyle.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/13/23.
//

import Foundation
import SwiftUI

struct ItemButtonStyle: ButtonStyle{
    
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            configuration.label
            
            if configuration.isPressed{
                Color.black.opacity(0.2)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
    
}
