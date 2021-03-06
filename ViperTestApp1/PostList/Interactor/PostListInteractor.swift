//
//  PostListInteractor.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright (c) 2018年 Tomokatsu Iguchi. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    
    var localDatamanager: PostListLocalDataManagerInputProtocol?
    
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            if let postList = try localDatamanager?.retrievePostList(){
                let postModelList = postList.map() {
                    return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
                }
                if postModelList.isEmpty {
                    remoteDatamanager?.retrievePostList()
                } else {
                    presenter?.didRetrievePosts(postModelList)
                }
            } else {
                remoteDatamanager?.retrievePostList()
            }
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
    
    
}

// MARK: - Extensions -

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDatamanager?.savePost(id: postModel.id, title: postModel.title, imageUrl: postModel.imageUrl, thumbImageUrl: postModel.thumbImageUrl)
            } catch {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
