//
//  PostModel.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright © 2018年 Tomokatsu Iguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostModel {
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
}


extension PostModel: Mappable {
    
    init?(map: Map) {
    }
    
    // struct, enumで自身の値を変更する場合、funcの前にmutatingキーワードを書く
    // @see: https://qiita.com/shtnkgm/items/3a00117c9b918616d116
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        imageUrl <- map["url"]
        thumbImageUrl <- map["thumbUrl"]
    }
    
}
