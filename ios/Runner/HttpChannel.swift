//
//  HttpChannel.swift
//  Runner
//
//  Created by Victor Proppe on 29/04/23.
//

import Foundation
import Flutter

class HttpChannel : MethodChannel {
    init(controller: FlutterViewController) {
        self.controller = controller
    }
    
    private let controller: FlutterViewController!
    
    func makeRequest(channel: String, httpMethod: HttpMethods) {
        super.channel = FlutterMethodChannel(name: channel, binaryMessenger: controller.binaryMessenger)
        super.callMethod {call, result in
            
            let parameters = call.arguments as? [Any]
            
            var methodResult: [String: Any] = ["value": NSNull(), "error": NSNull()]
            
            guard let url = parameters?[0] else {
                print("NO URL PASSED")
                return
            }
            
            guard let token = parameters?[1] else {
                print("NO TOKEN PASSED")
                return
            }
            
            let arg = parameters?[2]
            
            self.prepareRequest(url: url as? String ?? "", token: token as? String ?? "", httpMethod: httpMethod, arg: arg, onError: { error in
                methodResult["error"] = error
                print(methodResult)
                result(methodResult)
                
            }, onSuccess: { value in
                methodResult["value"] = value
                result(methodResult)
            })
        }
    }
        
    private func prepareRequest(url: String, token: String, httpMethod: HttpMethods = .GET, arg: Any?, onError: @escaping (Any) -> Void, onSuccess: @escaping ([String:Any]) -> Void) {
        var request =  URLRequest(url: URL(string: httpMethod == .GET ? "\(url)?page=\(arg ?? 1)" : url)!)

            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
            request.httpMethod = httpMethod.value
        
        if(arg != nil && httpMethod != .GET) {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: arg ?? ["":""], options: .fragmentsAllowed)
            } catch {
                print(error.localizedDescription)
            }
        }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    onError("\(error?.localizedDescription ?? "unknown error")")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    onError("No status code returned")
                    return
                }
                
                guard let value = data else {
                    onError("Data received is null")
                    return
                }
                
                do {
                    guard let decodedValue = try JSONSerialization.jsonObject(with: value, options: .allowFragments) as? [String:Any] else {
                        onError("Couldn't decode data")
                        return
                    }
                    
                    if httpResponse.statusCode >= 400 {
                        onError(decodedValue)
                    } else {
                        onSuccess(decodedValue)
                    }
                } catch {
                    onError("\(error.localizedDescription)")
                }
            }.resume()
        }
}
