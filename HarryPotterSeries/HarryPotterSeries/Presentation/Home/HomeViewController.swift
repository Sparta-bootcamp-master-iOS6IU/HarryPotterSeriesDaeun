//
//  HomeViewController.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/24/25.
//

import UIKit
import Combine
import CombineCocoa

final class HomeViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: HomeViewModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - View
    private let homeView = HomeView()
    
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
        
        bindViewModel()
        bindView()
        viewModel.loadBooks()
        viewModel.change()
    }
    
    // MARK: - Methods
    private func bindViewModel() {
        viewModel.$selectedBook
            .receive(on: DispatchQueue.main)
            .sink { [weak self] book in
                guard let self, let book else { return }
                homeView.configureView(with: book)
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.showAlert(title: AlertTitle.networkError, message: errorMessage)
            }
            .store(in: &cancellables)
        
        viewModel.$summaryText
            .combineLatest(viewModel.$showExpandButton)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] summary, show in
                guard let summary else { return }
                self?.homeView.setSummary(with: summary, isExpandable: show)
            }
            .store(in: &cancellables)
        
        viewModel.$isExpandedSummary
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isExpanded in
                self?.homeView.summaryView.updateExpandButtonState(isExpanded: isExpanded)
            }
            .store(in: &cancellables)
    }
    
    private func bindView() {
        homeView.summaryView.expandButton.tapPublisher
            .sink { [weak self] in
                self?.viewModel.toggleExpandButton()
            }
            .store(in: &cancellables)
    }
}

