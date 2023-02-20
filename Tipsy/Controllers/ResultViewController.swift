//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ildar Garifullin on 19/02/2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    //MARK: - let/var
    
    private let totalView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let resultTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "56.32"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 45)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let splitLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 people, with 10% tip."
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - flow funcs
    
    @objc private func recalculateButtonTapped() {
        dismiss(animated: true)
    }

    //MARK: - public
}

//MARK: - extensions setupViews

extension ResultViewController {
    
    private func setupViews() {
        view.addSubview(totalView)
        
        totalView.addSubview(totalLabel)
        totalView.addSubview(resultTotalLabel)
        
        view.addSubview(splitLabel)
        view.addSubview(recalculateButton)
    }
}

//MARK: - extensions setConstraints

extension ResultViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            totalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalView.topAnchor.constraint(equalTo: view.topAnchor),
            totalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            totalLabel.topAnchor.constraint(equalTo: totalView.safeAreaLayoutGuide.topAnchor, constant: 40),
            totalLabel.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            resultTotalLabel.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            resultTotalLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 20),
            resultTotalLabel.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            resultTotalLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            splitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            splitLabel.topAnchor.constraint(equalTo: totalView.bottomAnchor, constant: 20),
            splitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            splitLabel.heightAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

