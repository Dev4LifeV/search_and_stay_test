//
//  HttpPostChannel.swift
//  Runner
//
//  Created by Victor Proppe on 29/04/23.
//

import Foundation
class HttpDeleteChannel: HttpChannel {
    func makeRequest(channel: String) {
        super.makeRequest(channel: channel, httpMethod: .DELETE)
    }
}
