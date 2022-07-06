//
//  Questions.swift
//  Quizzler 2.0
//
//  Created by Sebastian Güiza 29-06-22.
//

import Foundation

struct Question {
     
    let text: String
    let answer: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String ){
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
    
}

