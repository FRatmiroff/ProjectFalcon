//
//  LoadingProgressBar.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 11/21/24.
//

import UIKit

class LoadingViewController: UIViewController {
    private let progressBar = UIProgressView(progressViewStyle: .default)
    private let progressLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        simulateLoading()
    }

    private func setupUI() {
        view.backgroundColor = .white

        // Configure Progress Bar
        progressBar.progress = 0.0
        progressBar.trackTintColor = .lightGray
        progressBar.tintColor = .blue
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)

        // Configure Progress Label
        progressLabel.text = "Loading..."
        progressLabel.font = UIFont.systemFont(ofSize: 16)
        progressLabel.textColor = .darkGray
        progressLabel.textAlignment = .center
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)

        // Add Constraints
        NSLayoutConstraint.activate([
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),

            progressLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func simulateLoading() {
        var progress: Float = 0.0

        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            progress += 0.02
            self.progressBar.progress = progress

            if progress >= 1.0 {
                timer.invalidate()
                self.transitionToMainApp()
            }
        }
    }

    private func transitionToMainApp() {
        // Replace this with your main app view controller
        let mainVC = ViewController() // Adjust to your main app view controller class
        mainVC.modalTransitionStyle = .crossDissolve
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
}
