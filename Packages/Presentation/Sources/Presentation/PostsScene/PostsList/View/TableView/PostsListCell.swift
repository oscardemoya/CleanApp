//
//  PostsListCell.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import UIKit
import Domain

class PostsListCell: UITableViewCell, Dequeable {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    func render(model: Model) {
        titleLabel.text = model.title
        bodyLabel.text = model.body
    }
}

extension PostsListCell {
    struct Model: Hashable {
        var id: Int
        var title: String = ""
        var body: String = ""
        
        init(post: Post) {
            self.id = post.id
            self.title = post.title
            self.body = post.body
        }
    }
}
