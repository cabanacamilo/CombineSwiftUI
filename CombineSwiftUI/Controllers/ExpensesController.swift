//
//  ViewController.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import UIKit

class ExpensesController: UITableViewController {
    
    private var expenses: [Expense] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        fecthExpenses()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesCell.cellID, for: indexPath) as! ExpensesCell
        cell.configure(with: expenses[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(DetailsController(with: expenses[indexPath.row]), animated: true)
    }
    
//    MARK: - Helpers
    
    private func fecthExpenses() {
        Task {
            let expenses = await APIService.shared.fecthExpensesData()
            self.expenses = expenses.expenses
            tableView.reloadData()
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Expenses"
    }
    
    private func configureTableView() {
        tableView.register(ExpensesCell.self, forCellReuseIdentifier: ExpensesCell.cellID)
    }
}

