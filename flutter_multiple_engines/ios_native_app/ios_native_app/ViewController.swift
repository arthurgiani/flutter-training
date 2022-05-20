//
//  ViewController.swift
//  ios_native_app
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
        
    @objc func showEngine1() {
        let navController = self.navigationController!        
    }
    
    @objc func showEngine2() {
        
    }
}

