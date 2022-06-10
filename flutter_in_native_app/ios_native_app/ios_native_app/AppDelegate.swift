//
//  AppDelegate.swift
//  ios_native_app
//
//  Created by Arthur Giani Alves Pereira on 22/04/22.
//

import UIKit
import Flutter
// Used to connect plugins (only if you have plugins with iOS platform code).
import FlutterPluginRegistrant
import FirebaseCore

@main
class AppDelegate: FlutterAppDelegate {
    
    var flutterEngine = FlutterEngine(name: "flutter_module")


    override
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        // Runs the default Dart entrypoint with a default Flutter route.
        
        flutterEngine.run();
        // Used to connect plugins (only if you have plugins with iOS platform code).
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        
        let methodChannel = FlutterMethodChannel(name: "native.app/test",
                                                         binaryMessenger: flutterEngine.binaryMessenger)
        
        methodChannel.setMethodCallHandler({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Place to configure implementation of methods invoked from flutter side.
        })

        return true
    }
}

