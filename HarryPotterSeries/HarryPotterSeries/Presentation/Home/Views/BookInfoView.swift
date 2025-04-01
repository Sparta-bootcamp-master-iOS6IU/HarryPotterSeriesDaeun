//
//  BookInfoView.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/31/25.
//

import UIKit
import SnapKit
import Then

final class BookInfoView: UIView {
    
    // MARK: - Components
    
    private let bookCoverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    private let bookTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.numberOfLines = .zero
    }
    
    private let authorLabel = TitleContentView(title: SectionTitle.author,
                                                  titleFontSize: 16,
                                                  contentFontSize: 18,
                                                  contentColor: .darkGray)
    
    private let releasedDateLabel = TitleContentView(title: SectionTitle.releasedDate)
    
    private let pagesLabel = TitleContentView(title: SectionTitle.pages)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupAddViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupAddViews() {
        [
            bookCoverImageView,
            infoStackView
        ].forEach { addSubview($0) }
        
        [
            bookTitleLabel,
            authorLabel,
            releasedDateLabel,
            pagesLabel
        ].forEach { infoStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        bookCoverImageView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(bookCoverImageView.snp.width).multipliedBy(1.5)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(bookCoverImageView.snp.trailing).offset(16)
        }
    }
    
    func configureView(with book: Book) {
        bookCoverImageView.image = UIImage(named: book.coverImageName)
        bookTitleLabel.text = book.title
        authorLabel.setContent(book.author)
        releasedDateLabel.setContent(book.formattedReleasedDate)
        pagesLabel.setContent(String(book.pages))
    }
}
