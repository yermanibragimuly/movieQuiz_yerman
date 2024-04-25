//
//  MoviesLoadingProtocol.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 25.04.2024.
//

import Foundation

protocol MoviesLoadingProtocol {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}
