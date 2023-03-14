//
//  MenuView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/13/23.
//

import SwiftUI

struct Item: Identifiable{
    
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
}

struct MenuView: View {
    
    let categories = [
        Item(title: "Family", image: "figure.2.and.child.holdinghands", imgColor: .red),
        Item(title: "Dancing", image:"figure.socialdance",
             imgColor: .yellow),
        Item(title: "Friends", image: "figure.2.arms.open",
             imgColor: .orange),
        Item(title: "Solo", image: "figure.arms.open",
             imgColor: .green),
        Item(title: "Home", image: "house",
             imgColor: .blue),
        Item(title: "Home", image: "house",
             imgColor: .purple),
        Item(title: "Dance", image: "figure.dance",
             imgColor: .black),
        
    ]
    
    let spacing: CGFloat = 10
    @State private var numberOfCols = 1
    
    var body: some View {
        let cols = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: numberOfCols)

        
        ScrollView {
            
            headerView
            
            LazyVGrid(columns: cols, spacing: spacing) {
                ForEach(categories){item in
                    Button(action: {}) {
                        ItemView(item: item)
                    }
                    .buttonStyle(ItemButtonStyle(cornerRadius: 20))
                }
            }
            .padding(.horizontal)
            .offset(y: -50)
        }
        .background(Color.white)
        .ignoresSafeArea()
        
    }
    
    var headerView: some View {
        VStack{
            Image("")
                .resizable()
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .onTapGesture {
                    numberOfCols = numberOfCols % 3 + 1
                }
            
            Text("TEMPORARY")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .medium, design: .rounded))
            
            Text("CHANGE SOMETHINGS IDK")
                .foregroundColor(Color.white.opacity(0.7))
                .font(.system(size: 30, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(Color.purple)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}