//
//  StarInfo.swift
//  StarInfoApp
//
//  Created by roshan on 6/11/2023.
//

import Foundation
public class StarInfo{
    
        var id: String?
        var Name: String
        var Born: String
        var Birthplace: String
        var Occupation: String
        var Nationality: String
    var Image: String
        
    init(Name: String, Born: String, Nationality: String, Occupation: String, Birthplace: String,Image: String) {
            self.Name = Name
            self.Born = Born
            self.Birthplace = Birthplace
            self.Occupation = Occupation
            self.Nationality = Nationality
            self.Image = Image
        }
        
    convenience init(id: String, Name: String, Born: String, Nationality: String, Occupation: String, Birthplace: String, Image:String) {
            self.init(Name: Name, Born: Born, Nationality: Nationality, Occupation: Occupation, Birthplace: Birthplace, Image: Image)
            self.id = id
        }
        
        convenience init(id: String){
            self.init(Name: "", Born: "", Nationality: "",  Occupation: "", Birthplace: "", Image:"")
            self.id = id
        }
        
        convenience init(id: String, dictionary: [String: Any]){
            self.init(  id: id,
                        Name: dictionary["Name"] as! String,
                        Born: dictionary["Born"] as! String,
                        Nationality: dictionary["Nationality"] as! String,
                        Occupation: dictionary["Occupation"] as! String,
                        Birthplace: dictionary["Birthplace"] as! String,
                       Image: dictionary["Image"] as! String
                   
            )
        }
        //since id it's an optional we can provide a default value when it's nil
        func toString() -> String {
            return "id: \(self.id ?? "" ), name: \(self.Name), email: \(self.Born), phone: \(self.Birthplace), photo: \(self.Occupation), position: \(self.Nationality)"
        }
    }
