//
//  ViewController.swift
//  6_GettingCurrentDateTime
//
//  Created by absin on 1/26/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func refreshDateTime(_ sender: UIButton) {
        updateLabel()
    }
    
    func updateLabel(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateTimeLabel.text = (dateFormatter.string(from: Date()))
        
    }

}

