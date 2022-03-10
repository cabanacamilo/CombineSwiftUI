//
//  DetailsView.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import UIKit

class DetailsView: UIView {
    
    private let merchantLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let paymentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let padding = 16.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    private func createView() {
        backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [merchantLabel, amountLabel, statusLabel, paymentLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    
    func configure(with expense: Expense) {
        merchantLabel.text = expense.merchant
        amountLabel.text = "¥\(expense.amount)"
        statusLabel.text = expense.status
        paymentLabel.text = expense.payment
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
