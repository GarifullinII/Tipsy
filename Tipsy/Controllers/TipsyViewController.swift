//
//  ViewController.swift
//  Tipsy
//
//  Created by Ildar Garifullin on 18/02/2023.
//

import UIKit

final class TipsyViewController: UIViewController {
    
    //MARK: - let/var
    
    var buttons = [UIButton]()
    
    var tipsyBrain = TipsyBrain()
    
    var selectedTip: Int? {
        didSet {
            calculateButton.isEnabled = selectedTip != nil
        }
    }
    
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
        stepper.minimumValue = 1
        stepper.maximumValue = 10
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
    
    private func setupButtons() {
        for i in 0..<3 {
            let button = UIButton(type: .system)
            button.setTitle("\(i * 10)%", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
            button.tintColor = .systemGreen
            button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.tag = i
            button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            buttons.append(button)
        }
    }
    
    @objc private func tipChanged(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        selectedTip = sender.tag
        updateTips()
    }

    @objc private func stepperValueChanged() {
        stepperLabel.text = String(format: "%.0f", stepper.value)
    }
    
    @objc private func calculateButtonTapped(_ sender: UIButton) {
        // get bill total
        var textFieldValue: Double
        guard let textField = billTotalTextField.text else {
            return
        }
        textFieldValue = Double(textField) ?? 0.0
        
        // select tip (percent)
        let percentValue = Double(percent())
        
        // choose split
        let stepperValue = Double(stepper.value)
        
        tipsyBrain.calculateTipsy(textFieldValue: textFieldValue, percentValue: percentValue, stepperValue: stepperValue)
        
        // choose ResultViewController
        let secondVC = ResultViewController()
        secondVC.resultTotal = tipsyBrain.getValue()
        secondVC.resultPercent = String(percentValue)
        secondVC.resultStepperValue = String(stepperValue)
        present(secondVC, animated: true)
    }
    
    //MARK: - public
    
    func updateTips() {
        for i in 0..<buttons.count {
            buttons[i].isSelected = i == selectedTip
        }
    }
    
    func percent() -> Double {
        var percent: Double = 0.0
        
        switch selectedTip {
        case 0:
            percent = 0
        case 1:
            percent = 0.1
        case 2:
            percent = 0.2
        default:
            break
        }
        
        return percent
    }
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
        
        setupButtons()
        
        buttonStackView = UIStackView(
            arrangedSubviews: buttons,
            axis: .horizontal,
            spacing: 5,
            distribution: .fillEqually
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
