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
    
    private let seriesButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
    }
    
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
            seriesButton
        ].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        seriesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    func configureView(with book: Book) {
        titleLabel.text = book.title
        seriesButton.setTitle("1", for: .normal)
    }

}
