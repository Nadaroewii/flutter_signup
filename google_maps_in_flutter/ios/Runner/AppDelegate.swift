import UIKit
import Flutter
import GoogleMaps  // Add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     // TODO: Add your Google Maps API key
            GMSServices.provideAPIKey("AIzaSyAKRe7f1OZiGSnLCaG6uRN90Zn3Unexg94")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
