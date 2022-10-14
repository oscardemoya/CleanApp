//
//  ViewController.swift
//  CleanApp
//
//  Created by Oscar De Moya on 5/10/22.
//

import UIKit
import Networking
import Domain
import Data
import Presentation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Presentation.bundle.bundleIdentifier ?? "")
    }
    
    @IBSegueAction func showPostsList(_ coder: NSCoder) -> UIViewController? {
        let apiClient = appDelegate.appDIContainer.apiClient
        let dataSource = PostsAPIDataSource(apiClient: apiClient)
        let repository = PostsRepository(dataSource: dataSource)
        let useCase = FetchPostsUseCase(repository: repository)
        let viewModel = PostsListViewModel(postsListUseCase: useCase)
        return PostsListViewController(viewModel: viewModel, coder: coder)
    }
}
