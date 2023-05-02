//
//  HttpMethods.swift
//  Runner
//
//  Created by Victor Proppe on 29/04/23.
//

import Foundation

enum HttpMethods {
    case GET
    case POST
    case PUT
    case DELETE
}

extension HttpMethods {
    var value: String {
        
        get {
            return "\(self)"
        }
        
    }
}
