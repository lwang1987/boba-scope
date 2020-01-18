//
//  User.swift
//  Boba Scope
//
//  Created by Maryam Siddiqui on 1/18/20.
//  Copyright © 2020 Linglong Wang. All rights reserved.
//

import Firebase

class User {
    
    var username: String!
    var name: String!
    var profileImageUrl: String!
    var uid: String!
    
    init(uid: String, dictionary: Dictionary<String, AnyObject>) {
        
        self.uid = uid
        
        if let username = dictionary["username"] as? String {
            self.username = username
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
            self.profileImageUrl = profileImageUrl
        }
    }
}
