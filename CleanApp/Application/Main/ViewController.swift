//
//  ViewController.swift
//  CleanApp
//
//  Created by Oscar De Moya on 5/10/22.
//

import UIKit
import Networking

class ViewController: UIViewController {

    let client = APIClient(baseURL: "https://jsonplaceholder.typicode.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let response: Response<[Post]> = try await client.get("/posts")
                print(response.value)
            } catch {
                print(error)
            }
        }
    }

}

struct Post: Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
