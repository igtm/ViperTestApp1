//
//  PostTableCellViewController.swift
//  ViperTestApp1
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//  Copyright © 2018年 Tomokatsu Iguchi. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableCellViewController: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.title
        let url = URL(string: post.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
