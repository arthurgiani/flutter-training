//
//  Engine1ViewController.swift
//  ios_native_flutter_engine
//
//  Created by Arthur Giani Alves Pereira on 20/05/22.
//

import Flutter
import FlutterPluginRegistrant
import Foundation


class Engine1ViewController: FlutterViewController {
  private var channel: FlutterMethodChannel?

    init(withEntrypoint entryPoint: String?, initialRoute: String?) {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil, initialRoute: initialRoute)
    GeneratedPluginRegistrant.register(with: newEngine)
    super.init(engine: newEngine, nibName: nil, bundle: nil)
    self.modalPresentationStyle = .fullScreen
  }

  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
