//
//  PostListRemoteDataManager.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright © 2018年 Tomokatsu Iguchi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[PostModel]>) in
                switch response.result {
                case .success(let posts):
                    self.remoteRequestHandler?.onPostsRetrieved(posts)
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
    
}
