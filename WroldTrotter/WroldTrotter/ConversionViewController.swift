//
//  ConversionViewController.swift
//  WroldTrotter
//
//  Created by 王靖伟 on 2018/7/11.
//  Copyright © 2018年 JingweiWang. All rights reserved.
//

//import Foundation
import UIKit

class ConversionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.minimumFractionDigits = 1
        return nf
    }()
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        //        celsiusLabel.text = textField.text
        
        //        if let text = textField.text, !text.isEmpty {
        //            celsiusLabel.text = text
        //        } else {
        //            celsiusLabel.text = "???"
        //        }
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
//            celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))

        } else {
            celsiusLabel.text = "???"
        }
    }
}
