//
//  Engine2ViewController.swift
//  ios_native_flutter_engine
//
//  Created by Arthur Giani Alves Pereira on 20/05/22.
//


import Flutter
import FlutterPluginRegistrant
import Foundation


class Engine2ViewController: FlutterViewController {
    private var channel: FlutterMethodChannel?

      init() {
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      let engine = appDelegate.engine2
      GeneratedPluginRegistrant.register(with: engine)
      super.init(engine: engine, nibName: nil, bundle: nil)
      self.modalPresentationStyle = .fullScreen
    }

    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}
