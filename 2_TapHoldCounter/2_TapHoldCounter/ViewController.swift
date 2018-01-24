//
//  ViewController.swift
//  2_TapHoldCounter
//
//  Created by absin on 1/24/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count: Int = 0
    //why doesn't it work if I declare the timer in longPress method?
    var gameTimer: Timer!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var tapHold: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapHold.addGestureRecognizer(tapGesture)
        let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        holdGesture.minimumPressDuration = 0.1
        tapHold.addGestureRecognizer(holdGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func singleTap(_ sender: UIGestureRecognizer){
        //print("Single Tap detected")
        count+=1
        counter.text = String(count)
    }
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
        
        if(sender.state == UIGestureRecognizerState.began){
            gameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(testingTimer), userInfo: nil, repeats: true)
        }
        else if(sender.state == UIGestureRecognizerState.ended){
            gameTimer?.invalidate()
        }
        //print("Long press detected")
    }
    
    @objc func testingTimer(){
        count+=1
        counter.text = String(count)
    }
    
    @IBAction func reset(_ sender: Any) {
        count = 0
        counter.text = String(count)
    }
}

