//
//  ViewController.swift
//  testing
//
//  Created by Admin on 22.04.22.
//

import UIKit

class ViewController: UIViewController {

       
    override func viewDidLoad() {
        
        
        var hello = "Hello, "

       hello.insert("!", at: hello.endIndex)
       hello.insert(contentsOf: " you", at: hello.index(before: hello.endIndex))
        
        print(hello)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

