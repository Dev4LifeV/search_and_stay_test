//
//  HttpChannel.swift
//  Runner
//
//  Created by Victor Proppe on 27/04/23.
//

import Foundation
class HttpGetChannel: HttpChannel {
    func makeRequest(channel: String) {
        super.makeRequest(channel: channel, httpMethod: .GET)
    }
}
