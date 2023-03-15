//
//  ViewModel.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/11/23.
//
import SwiftUI
import Foundation
import Firebase

class ViewModel: ObservableObject{
    
    //@Published var list = ["Apple", "Carrot", "Banana"]
    @Published var list = [Picture]()
    
    @Published var categoryType: String = "friends"
    //fetches data items to store in list
    //because its a published library it going update visually
    
    func getData(){
        
        //get reference to database
        let db = Firestore.firestore()
        
        //Read the documents at a specific path
        db.collection("\(categoryType)").getDocuments { snapshot, error in
            
            //check for error
            if error == nil{//no erros
                
                if let snapshot = snapshot{
                    //get all documents and create todos
                    
                    
                    //updates list property in the main thread
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { doc in //transforms documents to todos
                            
                            //create Todo item for each document retuned 
                            return Picture(id: doc.documentID,
                                        //name: doc["name"] as? String ?? "",
                                        //notes: doc["notes"] as? String ?? "",
                                        pictureURl: doc["picture"] as? String ?? "")
                        }
                        
                    }
                    
                    
                }
                
            }else{//handle error
                
            }
        }
        
    }
    
}
