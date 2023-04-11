//
//  ViewController.swift
//  Quizzler
//
//  Created by Александра Савчук on 09.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstChoise: UIButton!
    @IBOutlet weak var secondChoise: UIButton!
    @IBOutlet weak var thirdChoise: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        firstChoise.setTitle(answerChoices[0], for: .normal)
        secondChoise.setTitle(answerChoices[1], for: .normal)
        thirdChoise.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        firstChoise.backgroundColor = UIColor.clear
        secondChoise.backgroundColor = UIColor.clear
        thirdChoise.backgroundColor = UIColor.clear
    }
}

