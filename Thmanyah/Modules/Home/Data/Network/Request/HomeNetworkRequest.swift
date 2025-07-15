//
//  HomeNetworkRequest.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import NetworkLayer

struct HomeNetworkRequest: NetworkRequest {
    var host: String = NetworkConstants.baseHomeHost
    var path: String = NetworkConstants.Path.homePath
    var method: NetworkLayer.HTTPMethod = .get

    let page: Int

    var queryParameters: [String: String]? {
        [NetworkConstants.QueryKey.page: "\(page)"]
    }
}
