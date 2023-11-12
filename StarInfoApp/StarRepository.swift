//
//  StarRepository.swift
//  StarInfoApp
//
//  Created by roshan on 6/11/2023.
//

import Foundation
import FirebaseFirestore


class StarRepository{
    
    var db = Firestore.firestore()
    var starInfo = [StarInfo]()
    
    func findStarById(id: String, onCompletion : @escaping (StarInfo?) -> Void){
        let docRef = db.collection("StarInfo").document(id)
        var StarInfoResult : StarInfo!
        
        docRef.getDocument { (document, error) in
             
            if let doc = document, doc.exists {
               let data = doc.data()
                StarInfoResult = StarInfo(id: doc.documentID, dictionary: data!)
                onCompletion(StarInfoResult)
            }else {
                print("Document for the id: \(id) does not exist")
            }
        }
        
    }
    
    func add(starInfo: StarInfo) -> Bool {
        var result = true
        let dictionary : [String : Any] = [
            "Name": starInfo.Name,
            "Born": starInfo.Born,
            "Occupation": starInfo.Occupation,
            "Nationality": starInfo.Nationality,
            "Birthplace": starInfo.Birthplace,
            "Image": starInfo.Image
            
            
        ]
        
        db.collection("StarInfo").addDocument(data: dictionary){ error in
            if let error = error {
                print("StarInfo Could not be added: \(starInfo.toString()), error: \(error)")
                result = false
            }else{
                print("starInfo Added: \(starInfo.toString())")
            }
        }
        return result
    }
    
    func delete(starInfo: StarInfo) -> Bool {
        var result = true
        db.collection("StarInfo").document(starInfo.id!).delete(){ error in
            if let error = error {
                print("Error removing document: \(error)")
                result = false
            }else{
                print("Document successfully deleted")
            }
            
        }
        return result
    }
    
    func update(starInfo: StarInfo) -> Bool {
        var result = true

        let dictionary : [String : Any] = [
            "Name": starInfo.Name,
            "Born": starInfo.Born,
            "Occupation": starInfo.Occupation,
            "Nationality": starInfo.Nationality,
            "Birthplace": starInfo.Birthplace,
            "Image": starInfo.Image
        ]
        
        db.collection("StarInfo").document(starInfo.id!).updateData(dictionary){ error in
            if let error = error {
                print("Error updating document: \(error)")
                result = false
            }else{
                print("Document updated")
            }
        }

        return result
    }
    
}
