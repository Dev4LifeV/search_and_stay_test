//
//  MethodChannel.swift
//  Runner
//
//  Created by Victor Proppe on 27/04/23.
//

import Foundation
import Flutter

class MethodChannel {
    
    var channel: FlutterMethodChannel!
    
    func callMethod(handler: @escaping (_ call: FlutterMethodCall, _ result: @escaping FlutterResult) -> Void) {
        self.channel.setMethodCallHandler(handler)
    }
    
}
