import UIKit
import Flutter
import GoogleMaps
import FlutterPluginRegistrant

@UIApplicationMain

@objc class AppDelegate: FlutterAppDelegate {
 lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  flutterEngine.run();
  GeneratedPluginRegistrant.register(with: self)
   GMSServices.provideAPIKey("AIzaSyCeaBTry2YnTPFGYdD6IJqtT4HjFtOr8As")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

