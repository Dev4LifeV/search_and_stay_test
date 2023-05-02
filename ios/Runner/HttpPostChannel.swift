//
//  HttpPostChannel.swift
//  Runner
//
//  Created by Victor Proppe on 01/05/23.
//

import Foundation
class HttpPostChannel: HttpChannel {
    func makeRequest(channel: String) {
        super.makeRequest(channel: channel, httpMethod: .POST)
    }
}
