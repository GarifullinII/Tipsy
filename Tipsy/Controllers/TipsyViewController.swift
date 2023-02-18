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
    
    private let billTotalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let billTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let billTotalTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter bill total"
        textField.setContentHuggingPriority(UILayoutPriority(390), for: .horizontal)
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - flow funcs
    
    //MARK: - public
}

//MARK: - extensions setupViews

extension TipsyViewController {
    
    private func setupViews() {
        view.addSubview(billTotalView)
        
        billTotalStackView = UIStackView(
            arrangedSubviews: [
                billTotalLabel,
                billTotalTextField
            ],
            axis: .vertical,
            spacing: 10
        )
        
        billTotalView.addSubview(billTotalStackView)
    }
}

//MARK: - extensions setConstraints

extension TipsyViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            billTotalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billTotalView.topAnchor.constraint(equalTo: view.topAnchor),
            billTotalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billTotalView.heightAnchor.constraint(equalToConstant: 205)
        ])
        
        NSLayoutConstraint.activate([
            billTotalLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            billTotalStackView.leadingAnchor.constraint(equalTo: billTotalView.leadingAnchor),
            billTotalStackView.topAnchor.constraint(equalTo: billTotalView.safeAreaLayoutGuide.topAnchor, constant: 10),
            billTotalStackView.trailingAnchor.constraint(equalTo: billTotalView.trailingAnchor),
            billTotalStackView.bottomAnchor.constraint(equalTo: billTotalView.bottomAnchor, constant: 40)
        ])
    }
}

