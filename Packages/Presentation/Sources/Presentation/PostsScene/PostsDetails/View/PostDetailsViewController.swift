//
//  PostDetailsViewController.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import UIKit
import Domain

public class PostDetailsViewController: UIViewController {
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var userIdLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    var post: Bindable<Post>
    
    public init?(post: Post, coder: NSCoder) {
        self.post = Bindable(post)
        super.init(coder: coder)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    func setupBindings() {
        post.bind(\.id, to: idLabel, \.text) { "\($0)" }
        post.bind(\.userId, to: userIdLabel, \.text) { "\($0)" }
        post.bind(\.title, to: titleLabel, \.text)
        post.bind(\.body, to: bodyLabel, \.text)
    }
    
}
