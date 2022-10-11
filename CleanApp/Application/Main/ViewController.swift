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
    
    @IBSegueAction func showPostsList(_ coder: NSCoder) -> PostsListViewController? {
        let apiClient = appDelegate.appDIContainer.apiClient
        let repository = PostsRepository(apiClient: apiClient)
        let useCase = FetchPostsUseCase(repository: repository)
        let viewModel = PostsListViewModel(postsListUseCase: useCase)
        return PostsListViewController(viewModel: viewModel, coder: coder)
    }
}
