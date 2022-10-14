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
import Combine

public class PostsListViewController: UIViewController {
    var viewModel: PostsListViewModel
    lazy var dataSource: PostsListDiffableDataSource = makeDataSource()

    @IBOutlet var tableView: UITableView!
    
    public init?(viewModel: PostsListViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        Task {
            let page = AnyPage<_>(offset: 0, limit: 20)
            let posts = try await viewModel.fetchPosts(page: page)
            render(data: TableData(main: posts))
        }
    }
    
    @IBSegueAction func showPostDetails(_ coder: NSCoder, sender: Any?) -> UIViewController? {
//        guard let cell = sender as? PostsListCell else { return nil }
//        guard let indexPath = tableView.indexPath(for: cell) else { return nil }
//        guard let post = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let post = Post(id: 1, userId: 1, title: "Test", body: "Body Test")
        return PostDetailsViewController(post: post, coder: coder)
        
//        let apiClient = appDelegate.appDIContainer.apiClient
//        let dataSource = PostsAPIDataSource(apiClient: apiClient)
//        let repository = PostsRepository(dataSource: dataSource)
//        let useCase = FetchPostsUseCase(repository: repository)
//        let viewModel = PostsListViewModel(postsListUseCase: useCase)
//        return PostDetailsViewController(viewModel: viewModel, coder: coder)
    }

}
