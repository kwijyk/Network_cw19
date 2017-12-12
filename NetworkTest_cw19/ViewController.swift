//
//  ViewController.swift
//  NetworkTest_cw19
//
//  Created by Sergey Intern  on 12/8/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit
import  Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { (response) in
            
//            print(response)
            
            switch response.result {
            case .success(let value):
                
                let jsonObj = JSON(value)
                guard let jsonArry = jsonObj.array else { return }
                var posts: [Post] = []
                
                for objPost in jsonArry {
                    guard let post = Post(json: objPost) else { continue }
                    posts.append(post) 
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        let params: [String: Any] = ["title": "new post",
                                     "body": "new title",
                                     "userId": 10]
        
//        Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: .post, parameters: params).responseJSON { response in
//            print(response)
//        }
    
        let post = Post(id: 101, userId: 10, title: "Title", body: "Body")
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(post.id)", method: .delete, parameters: params).responseJSON { response in
            print(response)
        }
    }
}

