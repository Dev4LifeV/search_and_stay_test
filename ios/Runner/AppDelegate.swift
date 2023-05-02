import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller = window?.rootViewController as! FlutterViewController
            
      HttpGetChannel(controller: controller).makeRequest(channel: Channels.channelHttpGet)
      
      HttpDeleteChannel(controller: controller).makeRequest(channel: Channels.channelHttpDelete)
      
      HttpPutChannel(controller: controller).makeRequest(channel: Channels.channelHttpPut)
      
      HttpPostChannel(controller: controller).makeRequest(channel: Channels.channelHttpPost)
      
            
          GeneratedPluginRegistrant.register(with: self)
            
          return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
