//
//  FlutterEngineViewController.swift
//  ios_native_app
//
//  Created by Arthur Giani Alves Pereira on 22/04/22.
//

import Foundation
import UIKit
import Flutter
// Used to connect plugins (only if you have plugins with iOS platform code).
import FlutterPluginRegistrant

class FlutterModulePage1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a button to call the showFlutter function when pressed.
        self.showActionButton()
    }

    func showActionButton() {
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 130.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }

    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.pushRoute("/second")
        present(flutterViewController, animated: true, completion: nil)
    }
}
