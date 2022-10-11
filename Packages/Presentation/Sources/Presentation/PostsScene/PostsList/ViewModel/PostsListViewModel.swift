//
//  File.swift
//  
//
//  Created by Oscar De Moya on 10/10/22.
//

import Foundation
import Domain

public class PostsListViewModel {
    
    public var postsListUseCase: FetchPostsUseCase
    
    public init(postsListUseCase: FetchPostsUseCase) {
        self.postsListUseCase = postsListUseCase
    }
    
}
