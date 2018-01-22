//
//  ViewController.swift
//  TapCounter
//
//  Created by absin on 1/22/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    var value: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counter.text = String(value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: Any) {
        value+=1
        counter.text = String(value)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        value = 0
        counter.text = String(value)
    }
}

