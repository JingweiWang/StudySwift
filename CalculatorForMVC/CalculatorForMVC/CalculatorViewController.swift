//
//  CalculatorViewController.swift
//  CalculatorForMVC
//
//  Created by 王靖伟 on 2016/10/22.
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
    
    var cm = CalculatorModel()
    
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
        result=cm.evaluate(temp: result)
        print(result.0)
        labelValue=result.0
    }
    @IBAction func clear() {
        showLabel.text="0"
        notZero=false
    }
    
}
