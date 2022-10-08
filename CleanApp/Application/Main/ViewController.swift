//
//  ViewController.swift
//  CleanApp
//
//  Created by Oscar De Moya on 5/10/22.
//

import UIKit
import Networking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = TypicodeAPI()
        let request = Request<[Post]>(path: "/posts")
        let client = APIClient(api: api)
        Task {
            do {
                let posts: [Post] = try await client.send(request: request)
                print(posts)
            } catch {
                print(error)
            }
        }
    }

}

enum Environment {
    case production
}

struct TypicodeAPI: API {
    var environment: Environment
    var baseURL: URL { "https://jsonplaceholder.typicode.com" }
    
    init(environment: Environment = .production) {
        self.environment = environment
    }
}

struct Post: Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
