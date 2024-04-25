//
//  NetworkRoutingProtocol.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 25.04.2024.
//

import Foundation

protocol NetworkRouting {
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}
