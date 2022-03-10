//
//  DetailsController.swift
//  CombineSwiftUI
//
//  Created by Camilo Cabana on 2022/03/10.
//

import UIKit

class DetailsController: UIViewController {
    
    private let detailsView = DetailsView()
    private var expense: Expense
    
    init(with expense: Expense) {
        self.expense = expense
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.configure(with: expense)
        configureNavigationBar()
    }
    
//    MARK: - Helpers
    
    private func configureNavigationBar() {
        navigationItem.title = "Details"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
