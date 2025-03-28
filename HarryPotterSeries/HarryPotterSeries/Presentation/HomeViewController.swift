//
//  HomeViewController.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/24/25.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    private var cancellables = Set<AnyCancellable>()
    private var books: [Book] = []
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        viewModel.loadBooks()
    }
    
    private func bindViewModel() {
        viewModel.$books
            .receive(on: DispatchQueue.main)
            .sink { [weak self] books in
                self?.books = books
            }
            .store(in: &cancellables)
    }
}

