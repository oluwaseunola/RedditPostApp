//
//  PostModel.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import Foundation

struct PostModel : Codable{
    
    let data : PostDataModel
    
    
}

struct PostDataModel : Codable{
    
    let children : [Children]
    
}


struct Children : Codable,Identifiable{
    let id = UUID()
    let data : ChildrenDataModel
    
}

struct ChildrenDataModel : Codable{
    let subreddit : String
    let title : String
    let permalink : String
    let subreddit_subscribers : Int
}


