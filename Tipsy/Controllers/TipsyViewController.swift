//
//  ViewController.swift
//  Tipsy
//
//  Created by Ildar Garifullin on 18/02/2023.
//

import UIKit

final class TipsyViewController: UIViewController {
    
    //MARK: - let/var
    
    var billTotalStackView = UIStackView()
    
    private let billTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let billTotalTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter bill total"
        textField.setContentHuggingPriority(UILayoutPriority(390), for: .horizontal)
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let calculateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - flow funcs
    
    //MARK: - public
}

//MARK: - extensions setupViews

extension TipsyViewController {
    
    private func setupViews() {
        billTotalStackView = UIStackView(
            arrangedSubviews: [
                billTotalLabel,
                billTotalTextField
            ],
            axis: .vertical,
            spacing: 20,
            distribution: .fillProportionally
        )
        
        view.addSubview(billTotalStackView)
        
        view.addSubview(calculateView)
    }
}

//MARK: - extensions setConstraints

extension TipsyViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            billTotalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            billTotalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            billTotalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            billTotalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            calculateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculateView.topAnchor.constraint(equalTo: billTotalStackView.bottomAnchor, constant: 40),
            calculateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculateView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            calculateView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        ])
    }
}

