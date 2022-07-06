//
//  Questions.swift
//  Quizzler 2.0
//
//  Created by Sebastian Güiza 29-06-22.
//

import Foundation
import AVFoundation

struct QuizBrain {
    
    let quiz = [
        
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    var player: AVAudioPlayer!
    
    //Verificador de respuestas
    mutating func checkAnswer (_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].rightAnswer{
            
            score += 1
            
            let url = Bundle.main.url(forResource: "C", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            return true
        } else {
            
            let url = Bundle.main.url(forResource: "G", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            return false
        }
    }
    
    func getScore() -> Int {
        
        return score
    }
    
    func getQuestionsText() -> String {
        
        return quiz[questionNumber].text
    }
    
    func getQuestionsAnswer() -> [String] {
        return quiz[questionNumber].answer
    }
    
    func getProgress() -> Float {
        
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
        
    }
    
    mutating func nextQuestion(){
        
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
            
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
