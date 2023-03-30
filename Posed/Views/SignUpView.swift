//
//  SignUpView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/29/23.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    
    var body: some View {

            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack{
                    TextField("Email Address", text: $email)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button {
                        
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password)
                        
                    } label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                }
                .padding()
            }
            .navigationTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
