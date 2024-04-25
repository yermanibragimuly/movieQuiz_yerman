//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 25.04.2024.
//

import Foundation

protocol StatisticServiceProtocol {
    func store(correct count: Int, total amount: Int)
    
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
}
