//
//  ViewController.swift
//  Quiz
//
//  Created by 王靖伟 on 2018/7/10.
//  Copyright © 2018年 JingweiWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
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
        currentQuestionLabel.text=questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    @IBAction func showNextQuestion(_ sender:UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question:String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    @IBAction func showAnswer(_ sender:UIButton){
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
        //        let animationClosure = { () -> Void in
        //            self.currentQuestionLabel.alpha = 0
        //            self.nextQuestionLabel.alpha = 1
        //        }
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                        self.updateOffScreenLabel()
        })
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}
