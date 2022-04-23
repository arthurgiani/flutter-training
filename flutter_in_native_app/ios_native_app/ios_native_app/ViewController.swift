//
//  ViewController.swift
//  ios_native_app
//
//  Created by Arthur Giani Alves Pereira on 22/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inicio")
    }

    @IBAction func goTo(_ sender: UIButton) {
        self.showFlutterPage()
    }
    
    func showFlutterPage() {
        let flutterPage = FlutterModulePage1ViewController()
        self.present(flutterPage, animated: true, completion: ({}))
    }
}

