//
//  CalculatorModel.swift
//  CalculatorForMVC
//
//  Created by 王靖伟 on 2016/10/22.
//  Copyright © 2016年 JingweiWang. All rights reserved.
//

import Foundation

class CalculatorModel{
    func evaluate(temp:(Double,Double,String)) -> (Double,Double,String) {
        var temp = temp
        switch temp.2 {
        case "+":
            temp.0=temp.0+temp.1
        case "−":
            temp.0=temp.0-temp.1
        case "×":
            temp.0=temp.0*temp.1
        case "÷":
            temp.0=temp.0/temp.1
        default: break
        }
        return temp
    }
}
