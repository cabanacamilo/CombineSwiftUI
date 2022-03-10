//
//  Expenses.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import Foundation

struct Expenses: Codable {
    
    static let empty: Expenses = Expenses(expenses: [])
    
    var expenses: [Expense]
    
    enum CodingKeys: String, CodingKey {
        case expenses
    }
}

struct Expense: Codable {
    
    var id: String
    var merchant: String
    var amount: Int
    var status: String
    var payment: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case merchant
        case amount = "amount_cents"
        case status
        case payment = "payment_method"
    }
}
