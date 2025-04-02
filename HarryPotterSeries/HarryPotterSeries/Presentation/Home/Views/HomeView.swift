//
//  HomeView.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/28/25.
//

import UIKit
import SnapKit
import Then

final class HomeView: UIView {
    // MARK: - Components
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 24)
        $0.numberOfLines = 0
    }
    
    let seriesButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = BookSpacing.viewToView
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = BookSpacing.vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    private let bookInfoView = BookInfoView()
    private let dedicationView = BookDescriptionView()
    private(set) var summaryView = BookDescriptionView()
    private let chapterView = BookDescriptionView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        setupAddViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupAddViews() {
        [
            titleLabel,
            seriesButtonStackView,
            scrollView
        ].forEach { addSubview($0) }
        
        [
            contentStackView
        ].forEach { scrollView.addSubview($0) }
        
        [
            bookInfoView,
            dedicationView,
            summaryView,
            chapterView
        ].forEach { contentStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            make.horizontalEdges.equalToSuperview().inset(BookSpacing.horizontal)
        }
        
        seriesButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(seriesButtonStackView.snp.bottom).offset(BookSpacing.vertical)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalTo(safeAreaLayoutGuide.snp.horizontalEdges).inset(BookSpacing.horizontal)
        }
    }
    
    func configureView(with book: Book) {
        titleLabel.text = book.title
        bookInfoView.configureView(with: book)
        dedicationView.configureView(title: SectionTitle.dedication, contents: [book.dedication])
        chapterView.configureView(title: SectionTitle.chapter, contents: book.chapters.map { $0.title })
    }
    
    func setSummary(with summary: String, isExpandable: Bool) {
        summaryView.configureView(title: SectionTitle.summary, contents: [summary], isExpandable)
    }
    
    func setSeriesButtons(books: [Book]) {
        books.forEach { book in
            let button = makeSeriesButton(number: book.seriesNumber!)
            seriesButtonStackView.addArrangedSubview(button)
        }
    }
    
    private func makeSeriesButton(number: Int) -> UIButton {
        let button = UIButton().then {
            $0.setTitle(String(number), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 20
        }
        button.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return button
    }
}
