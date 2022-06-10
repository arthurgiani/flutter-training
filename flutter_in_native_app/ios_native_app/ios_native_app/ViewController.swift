//
//  ViewController.swift
//  ios_native_app
//
//  Created by Arthur Giani Alves Pereira on 22/04/22.
//

import UIKit
import Flutter


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goTo(_ sender: UIButton) {
        self.showFlutter()
    }
    
    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .fullScreen
        present(flutterViewController, animated: false, completion: nil)
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

