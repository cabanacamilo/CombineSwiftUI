//
//  ExpensesCell.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import UIKit

class ExpensesCell: UITableViewCell {
    
    static let cellID = "ExpensesCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: nil)
    }
    
    func configure(with expense: Expense) {
        textLabel?.text = "¥\(expense.amount)"
        detailTextLabel?.text = expense.merchant
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
