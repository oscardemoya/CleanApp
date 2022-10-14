//
//  PostsListDataSource.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import UIKit
import Domain

typealias PostsListDiffableDataSource = UITableViewDiffableDataSource<PostsListViewController.Section,
                                                                      PostsListCell.Model>

class PostsListDataSource: PostsListDiffableDataSource {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension PostsListViewController {
    enum Section: CaseIterable {
        case main
    }
    
    struct TableData {
        var main: [PostsListCell.Model]
    }
    
    func makeDataSource() -> PostsListDataSource {
        return PostsListDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, post in
                let cell = PostsListCell.dequeue(from: tableView, at: indexPath)
                cell.render(model: post)
                return cell
            }
        )
    }
    
    func render(data: TableData, animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, PostsListCell.Model>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(data.main, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
    func remove(_ post: PostsListCell.Model, animate: Bool = true) {
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([post])
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
