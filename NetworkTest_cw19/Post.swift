//
//  Post.swift
//  NetworkTest_cw19
//
//  Created by Sergey Intern  on 12/8/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import Foundation
import SwiftyJSON

struct Post {
    
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

extension Post {
    
    init?(json: JSON) {
        
        guard  let id = json["id"].int,
               let userID = json["userId"].int else { return nil }
        
        self.id = id
        self.userId = userID
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }
}
