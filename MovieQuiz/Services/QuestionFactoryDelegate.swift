//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 28.02.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
        func didReceiveNextQuestion(question: QuizQuestion?)
        func didLoadDataFromServer() // сообщение об успешной загрузке
        func didFailToLoadData(with error: Error) // сообщение об ошибке загрузки
}
