//
//  NetworkMonitor.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 08/05/23.
//

import Foundation
import Network

class NetworkMonitor
{

    static let shared: NetworkMonitor = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }

    func startMonitoring()
    {
        monitor.pathUpdateHandler = { path in
            self.status = path.status
        }

        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring()
    {
        monitor.cancel()
    }

}
