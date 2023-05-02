//
//  HttpPutChannel.swift
//  Runner
//
//  Created by Victor Proppe on 30/04/23.
//

import Foundation
class HttpPutChannel: HttpChannel {
    func makeRequest(channel: String) {
        super.makeRequest(channel: channel, httpMethod: .PUT)
    }
}

