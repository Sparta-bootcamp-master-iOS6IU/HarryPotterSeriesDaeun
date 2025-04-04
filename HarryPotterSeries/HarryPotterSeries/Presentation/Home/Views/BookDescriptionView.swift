//
//  BookDescriptionView.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 4/1/25.
//

import UIKit
import SnapKit
import Then

final class BookDescriptionView: UIView {
    
    // MARK: - Components
    
    private let titleLabel = UILabel().then {
        $0.numberOfLines = .zero
        $0.font = .boldSystemFont(ofSize: BookFontSize.title1)
        $0.textColor = .black
    }
    
    private let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = BookSpacing.viewToView
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    let expandButton = UIButton().then {
        $0.setTitle(ButtonTitle.expand, for: .normal)
        $0.setTitle(ButtonTitle.fold, for: .selected)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: BookFontSize.content)
    }
    
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
            titleLabel,
            contentStackView
        ].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(BookSpacing.viewToView)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureView(title: String, contents: [String], _ isExpandable: Bool = false) {
        titleLabel.text = title
        contentStackView.subviews.forEach { $0.removeFromSuperview() }
        addSubviewsToContentStack(with: contents)
        setExpandButtonVisible(isExpandable)
    }
    
    private func addSubviewsToContentStack(with contents: [String]) {
        for content in contents {
            let contentLabel = UILabel().then {
                $0.numberOfLines = .zero
                $0.font = .systemFont(ofSize: BookFontSize.content)
                $0.textColor = .darkGray
                $0.text = content
            }
            contentStackView.addArrangedSubview(contentLabel)
        }
        contentStackView.addArrangedSubview(expandButton)
    }
    
    private func setExpandButtonVisible(_ isExpandable: Bool) {
        expandButton.isHidden = !isExpandable
    }
    
    func updateExpandButtonState(isExpanded isSeleced: Bool) {
        expandButton.isSelected = isSeleced
    }
}
