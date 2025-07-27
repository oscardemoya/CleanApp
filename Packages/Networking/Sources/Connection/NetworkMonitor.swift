//
//  NetworkMonitor.swift
//  Networking
//
//  Created by Oscar De Moya on 2/4/25.
//

import Network
import SwiftUI

@MainActor
@Observable
public final class NetworkMonitor {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitorQueue", qos: .background)

    public private(set) var isConnected: Bool = true

    public init() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor in
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
