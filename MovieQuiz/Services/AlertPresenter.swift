//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Yerman Ibragimuly on 28.02.2024.
//
import UIKit
import Foundation

final class AlertPresenter: AlertPresenterProtocol {
    private weak var delegate: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.delegate = viewController
    }
    func showResult(alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: alertModel.buttonText,
            style: .default,
            handler: alertModel.completion)
    
        alert.addAction(action)
        
        guard let viewController = delegate else { return }
        viewController.present(alert, animated: true)
    }
}
