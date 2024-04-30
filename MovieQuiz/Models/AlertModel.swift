//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 28.02.2024.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    var completion: ((UIAlertAction) -> Void)?
}
