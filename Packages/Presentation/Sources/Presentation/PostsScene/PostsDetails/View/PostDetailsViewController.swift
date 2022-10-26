//
//  PostDetailsViewController.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import UIKit
import Domain
import Combine

public class PostDetailsViewController: UIViewController {
    var cancellable: AnyCancellable?
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var userIdLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    @Published var post: Post
    
    public init?(post: Post, coder: NSCoder) {
        self.post = post
        super.init(coder: coder)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureSubscribers()
    }
    
    func configureSubscribers() {
        cancellable = $post.sink { [weak self] value in
            guard let self else { return }
            self.titleLabel.text = value.title
            self.bodyLabel.text = value.body
        }
    }
    
}
