//
//  ViewController.swift
//  Tipsy
//
//  Created by Ildar Garifullin on 18/02/2023.
//

import UIKit

final class TipsyViewController: UIViewController {
    
    //MARK: - let/var
    
    var buttonIsActive: Bool = false
    
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
        textField.font = UIFont.systemFont(ofSize: 35)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let calculateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var selectStackView = UIStackView()
    
    private let selectLabel: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var buttonStackView = UIStackView()
    
    private let selectOneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.tintColor = .systemGreen
        button.addTarget(self, action: #selector(selectOneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let selectTenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("10%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.tintColor = .systemGreen
        button.addTarget(self, action: #selector(selectTenButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let selectTwentyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("20%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.tintColor = .systemGreen
        button.addTarget(self, action: #selector(selectTwentyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var stepperStackView = UIStackView()
    
    private let stepperLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 1
        stepper.addTarget(self, action:  #selector(stepperValueChanged), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        return stepper
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
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
    
    @objc private func selectOneButtonTapped() {
        changeBabackgroundColor(selectOneButton)
        
        buttonIsActive = !buttonIsActive
        print("selectOneButtonTapped")
    }
    
    @objc private func selectTenButtonTapped() {
        changeBabackgroundColor(selectTenButton)
        
        buttonIsActive = !buttonIsActive
        print("selectTenButtonTapped")
    }
    
    @objc private func selectTwentyButtonTapped() {
        changeBabackgroundColor(selectTwentyButton)
        
        buttonIsActive = !buttonIsActive
        print("selectTwentyButtonTapped")
    }
    
    @objc private func stepperValueChanged() {
        print("stepperValueChanged")
    }
    
    @objc private func calculateButtonTapped() {
        print("calculateButtonTapped")
    }
    
    private func changeBabackgroundColor(_ sender: UIButton) {
        if buttonIsActive {
            sender.backgroundColor = .clear
            sender.tintColor = .systemGreen
        } else {
            sender.backgroundColor = .systemGreen
            sender.tintColor = .white
            sender.layer.cornerRadius = 10
        }
    }
    
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
        
        buttonStackView = UIStackView(
            arrangedSubviews: [
                selectOneButton,
                selectTenButton,
                selectTwentyButton
            ],
            axis: .horizontal,
            spacing: 5,
            distribution: .fillProportionally
        )
        view.addSubview(buttonStackView)
        
        view.addSubview(calculateView)
        
        stepperStackView = UIStackView(
            arrangedSubviews: [
                stepperLabel,
                stepper
            ],
            axis: .horizontal,
            spacing: 10,
            distribution: .fillEqually
        )
        view.addSubview(stepperStackView)
        
        selectStackView = UIStackView(
            arrangedSubviews: [
                selectLabel,
                buttonStackView,
                chooseLabel,
                stepperStackView
            ],
            axis: .vertical,
            spacing: 15,
            distribution: .fillProportionally
        )
        view.addSubview(selectStackView)
        
        calculateView.addSubview(calculateButton)
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
        ])
        
        NSLayoutConstraint.activate([
            selectStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            selectStackView.topAnchor.constraint(equalTo: billTotalStackView.bottomAnchor, constant: 60),
            selectStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            calculateButton.centerXAnchor.constraint(equalTo: calculateView.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
