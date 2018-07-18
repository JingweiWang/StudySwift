//
//  ViewController.swift
//  Buggy
//
//  Created by 王靖伟 on 2018/7/18.
//  Copyright © 2018年 JingweiWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
//    @IBAction func buttonTaggeled(_ sender: UISwitch) {
//    @IBAction func buttonTapped(_ sender: UISwitch) {
//        print("Called button buttonTapped(_:)")
//        print("sender: \(sender)")
//        print("Is control on? \(sender.isOn)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }

    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
//        for _ in 0...10 {
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
        
        print(array)
    }
}

