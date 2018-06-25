//
//  PostListLocalDataManager.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright © 2018年 Tomokatsu Iguchi. All rights reserved.
//

import CoreData

class PostListLocalDataManager: PostListLocalDataManagerInputProtocol {
    // データを取得
    func retrievePostList() throws -> [Post] {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        
        return try managedOC.fetch(request)
    }
    
    // データ保存
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: "Post", in: managedOC) {
            let post = Post(entity: newPost, insertInto: managedOC)
            post.id = Int32(id)
            post.title = title
            post.imageUrl = imageUrl
            post.thumbImageUrl = thumbImageUrl
            // TODO: returnいるんじゃないの？？
            try managedOC.save()
        }
        throw PersistenceError.coundNotSaveObject
    }
    
    
}
