//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 王靖伟 on 2016/10/21.
//  Copyright © 2016年 JingweiWang. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    var notZero=false
    var result:(Double,Double,String)=(0,0,"+")
    var labelValue:Double{
        get{
            return NumberFormatter().number(from: showLabel.text!)!.doubleValue
        }
        set{
            showLabel.text="\(newValue)"
        }
    }
    
    @IBAction func appendDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        if notZero{
            showLabel.text = showLabel.text! + digit!
        }else if notZero==false && digit=="0"{
        }else{
            showLabel.text=digit
            notZero=true
        }
    }
    
    @IBAction func operate(_ sender: AnyObject) {
        let operation=sender.currentTitle!
        result.0=labelValue
        result.2=operation!
        labelValue=0
        notZero=false
    }
    
    @IBAction func equal() {
        result.1=labelValue
        print("\(result)运算结果为")
        switch result.2 {
        case "+":
            result.0=result.0+result.1
        case "−":
            result.0=result.0-result.1
        case "×":
            result.0=result.0*result.1
        case "÷":
            result.0=result.0/result.1
        default: break
        }
        print(result.0)
        labelValue=result.0
    }
    @IBAction func clear() {
        showLabel.text="0"
        notZero=false
    }
}
