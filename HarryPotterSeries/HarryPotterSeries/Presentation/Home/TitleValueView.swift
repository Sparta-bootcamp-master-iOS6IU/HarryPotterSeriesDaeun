//
//  TitleValueView.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/31/25.
//

import UIKit
import SnapKit
import Then

final class TitleContentView: UIView {
    
    // MARK: - Components
    
    private let titleLabel = UILabel().then {
        $0.numberOfLines = .zero
    }
    
    private let contentLabel = UILabel().then {
        $0.numberOfLines = .zero
    }
    
    // MARK: - Init
    
    init(title: String,
         titleFontSize: CGFloat = 14,
         titleColor: UIColor = .black,
         content: String? = nil,
         contentFontSize: CGFloat = 14,
         contentColor: UIColor = .gray) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: titleFontSize)
        contentLabel.font = .systemFont(ofSize: contentFontSize)
        contentLabel.textColor = contentColor
        
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
            contentLabel
        ].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
            make.verticalEdges.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
        }
    }
    
    func setContent(_ content: String) {
        contentLabel.text = content
    }
}
