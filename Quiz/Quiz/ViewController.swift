//
//  ViewController.swift
//  Quiz
//
//  Created by 王靖伟 on 2018/7/10.
//  Copyright © 2018年 JingweiWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel:UILabel!
    @IBOutlet var answerLabel:UILabel!
    let questions:[String] = [
        "What is 7+7?",
        "What is the capital of China?",
        "What is cognac made from?"
    ]
    let answers:[String] = [
        "14",
        "Beijing",
        "Grapes"
    ]
    var currentQuestionIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text=questions[currentQuestionIndex]
    }
    @IBAction func showNextQuestion(_ sender:UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question:String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    @IBAction func showAnswer(_ sender:UIButton){
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}
