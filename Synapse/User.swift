//
//  User.swift
//  Synapse
//
//  Created by alişan dağdelen on 30.07.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import ObjectMapper
import RealmSwift

class User: BaseObject {
    dynamic var email = ""
    dynamic var username = ""
    
    dynamic var token:String?
    
    override class func url() -> String {
        return "Users"
    }
    
    public required convenience init?(map: Map){
        self.init()
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        
        email       <-  map["email"]
        username    <-  map["username"]
        token       <-  map["token"]
        
    }
    
    class func currentUser() -> User! {
        return allObjects(User.self).first
    }
}
