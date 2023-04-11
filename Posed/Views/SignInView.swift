//
//  LoginView.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/29/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage

class AppViewModel: ObservableObject{
    
    
    let auth = Auth.auth()
    @Published var currentUser: User?//optional bc API take time to call, and user info will be nill for a sec
    private var tempUserSession: FirebaseAuth.User?
    @Published var userSession: FirebaseAuth.User? // stores user session, if user is logged in
    
    @Published var signedIn = false
    
    var isSignedin: Bool {
        //not nil = user is signed in
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            
            guard result != nil, error == nil else{
                return
            }
            //succses
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
            
        }
        
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            guard let user = result?.user else { return }
            self?.createUserDocument(uid: user.uid) // Add this line
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func createUserDocument(uid: String) {
        let newUser: [String: Any] = [
            "uid": uid,
            "profilePicture": ""
        ]

        let usersCollection = Firestore.firestore().collection("users")
        usersCollection.document(uid).setData(newUser) { error in
            if let error = error {
                print("Error creating user document: \(error.localizedDescription)")
            } else {
                print("User document created successfully")
            }
        }
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }

    
    
}



struct SignInView: View {
    
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    
    var body: some View {
        //NavigationView{
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
                    
                    viewModel.signIn(email: email, password: password)
                    
                } label: {
                    Text("Sign In")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                NavigationLink("Create Account") {
                    SignUpView()
                        .padding()
                }
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Sign In")
    }
    //}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

