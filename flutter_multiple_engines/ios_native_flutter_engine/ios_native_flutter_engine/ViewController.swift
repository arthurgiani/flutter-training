//
//  ViewController.swift
//  ios_native_flutter_engine
//
//  Created by Arthur Giani Alves Pereira on 20/05/22.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goTo(_ sender: UIButton) {
        self.showEngine1()
    }
    
    @IBAction func goToEngine2(_ sender: UIButton) {
        self.showEngine2()
    }
        
    @objc func showEngine1() {
        present(Engine1ViewController(withEntrypoint: nil, initialRoute: nil), animated: false)
    }
    
    @objc func showEngine2() {
        present(Engine1ViewController(withEntrypoint: nil, initialRoute: "/second"), animated: false)
    }
}

