//
//  PostsListViewController.swift
//  
//
//  Created by Oscar De Moya on 10/10/22.
//

import UIKit
import Domain
import Data
import Networking

public class PostsListViewController: UIViewController {
    
    private var viewModel: PostsListViewModel
    
    public init?(viewModel: PostsListViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task {
            let page = Page(offset: 0, limit: 20)
            let requestValue = FetchPostsUseCase.RequestValue(page: page)
            let posts = try await viewModel.postsListUseCase.execute(requestValue: requestValue)
            print(posts.posts.first?.title ?? "")
        }
    }

}
