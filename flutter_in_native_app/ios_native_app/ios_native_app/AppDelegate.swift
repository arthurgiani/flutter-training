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

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var flutterEngine = FlutterEngine(name: "flutter_module")



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Runs the default Dart entrypoint with a default Flutter route.
        flutterEngine.run();
        // Used to connect plugins (only if you have plugins with iOS platform code).
        GeneratedPluginRegistrant.register(with: self.flutterEngine);

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

