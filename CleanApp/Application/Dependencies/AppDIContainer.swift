//
//  AppDIContainer.swift
//  CleanApp
//
//  Created by Oscar De Moya on 10/10/22.
//  Copyright © 2022 Oscar De Moya. All rights reserved.
//

import Foundation
import Networking
import Domain
import Data
import Presentation

class AppDIContainer {
    
    // Network
    lazy var apiClient: APIClient = {
        let api = TypicodeAPI()
        let configuration: URLSessionConfiguration = .default
        return APIClient(api: api, session: configuration)
    }()
    
}
