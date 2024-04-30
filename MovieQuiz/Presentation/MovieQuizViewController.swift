import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
        
    // MARK: - Properties
    
    private var presenter: MovieQuizPresenter!
    private final var alertPresenter: AlertPresenterProtocol?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var isEnabledYesButton: UIButton!
    @IBOutlet private var isEnabledNoButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UIKit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        alertPresenter = AlertPresenter(viewController: self)
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        activityIndicator.transform = transfrom
        setupImageBorder(isHidden: true)
        activityIndicator.startAnimating()
    }
    func didReceiveNextQuestion(question: QuizQuestion?) {
            presenter.didReceiveNextQuestion(question: question)
        }
        
        // MARK: - IB Actions
    
        @IBAction private func noButtonClicked() {
            presenter.isEnabledNoButton()
        }
        
        @IBAction private func yesButtonClicked() {
            presenter.isEnabledYesButton()
        }
        
        func show(quiz step: QuizStepViewModel) {
            setupImageBorder(isHidden: true)
            imageView.image = step.image
            textLabel.text = step.question
            counterLabel.text = step.questionNumber
        }
        
        func show(quiz result: AlertModel) {
            alertPresenter?.showResult(alertModel: result)
        }
        
        func showNetworkError(message: String) {
            hideLoadingIndicator()
            show(quiz: AlertModel(title: "Ошибка!",
                                  message: message,
                                  buttonText: "Попробовать еще раз",
                                  completion: { [weak self] _ in
                guard let self else { return }
                presenter.restartGame()
            }))
        }
        
        func highlightImageBorder(isCorrectAnswer isCorrect: Bool) {
            blockButton(isBlocked: true)
            setupImageBorder(isHidden: false)
            imageView.layer.borderColor =  isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        }
        
        func blockButton(isBlocked: Bool) {
            isEnabledNoButton.isEnabled = !isBlocked
            isEnabledYesButton.isEnabled = !isBlocked
        }
        
        func setupImageBorder(isHidden: Bool) {
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = isHidden ? 0 : 8
            imageView.layer.cornerRadius = 20
        }
        
        func showLoadingIndicator() {
            activityIndicator.color = .black
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
        
        func hideLoadingIndicator() {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }

