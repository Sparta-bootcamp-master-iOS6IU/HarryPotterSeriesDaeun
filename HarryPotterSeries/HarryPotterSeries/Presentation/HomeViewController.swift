//
//  HomeViewController.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/24/25.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: HomeViewModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - View
    let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewModel.loadBooks()
        bindViewModel()
    }
    
    // MARK: - Methods
    private func bindViewModel() {
        viewModel.$selectedBook
            .receive(on: DispatchQueue.main)
            .sink { [weak self] book in
                guard let book else { return }
                self?.homeView.configureView(with: book)
            }
            .store(in: &cancellables)
    }
}

