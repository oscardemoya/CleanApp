//
//  Dequeable.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import UIKit

public protocol Dequeable: ReuseIdentifiable {}

public extension Dequeable where Self: UITableViewCell {
    static func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                       for: indexPath) as? Self else {
            fatalError("Could not dequeue table view cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }
}

public extension UITableView {
    func register<T: UITableViewCell & Dequeable>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
}

public extension Dequeable where Self: UICollectionViewCell {
    static func dequeue(from collectionView: UICollectionView, at indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? Self else {
            fatalError("Could not dequeue collection view cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }
}

public extension UICollectionView {
    func register<T: UICollectionViewCell & Dequeable>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
}
