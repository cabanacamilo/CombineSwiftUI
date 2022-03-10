//
//  APIService.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    private let stringURL = "https://run.mocky.io/v3/7edffa13-080b-4136-9422-6ab29fabf69d"
    
    enum APIError: Error {
        case response
    }
    
    func fecthExpensesData() async -> Expenses {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: stringURL)!)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.response }
            return try JSONDecoder().decode(Expenses.self, from: data)
        } catch {
            return Expenses.empty
        }
    }
}
