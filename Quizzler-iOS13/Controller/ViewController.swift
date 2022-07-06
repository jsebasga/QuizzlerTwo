//
//  Questions.swift
//  Quizzler 2.0
//
//  Created by Sebastian Güiza 29-06-22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
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
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionsText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answerOptions = quizBrain.getQuestionsAnswer()
        optionOne.setTitle(answerOptions[0], for: .normal)
        optionTwo.setTitle(answerOptions[1], for: .normal)
        optionThree.setTitle(answerOptions[2], for: .normal)
        
        //Back to the original colors
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
    }
    
    
    
}

