//
//  SocialData.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import Foundation


struct SocialData : Decodable{
    var datas:[SocialPost]
}

struct SocialPost : Decodable {
    var id:String
    var title:String
    var likes:Int
    var isLike:Bool
    var user:SocialUser
    var cover:SocialCover
    var status:Int
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case likes =  "likes"
        case isLike = "is_like"
        case user = "user"
        case cover = "cover"
        case status = "status"
    }
}

struct SocialUser : Decodable {
    var id:String
    var name:String
    var cover:URL?
}

struct SocialCover : Decodable {
    var url:URL
    var width:Float
    var height:Float
}
