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
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    private let contentLabel = UILabel().then {
        $0.numberOfLines = .zero
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
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
            contentLabel
        ].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureView(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
}
