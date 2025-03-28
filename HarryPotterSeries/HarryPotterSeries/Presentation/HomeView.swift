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
    let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 24)
        $0.numberOfLines = 0
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
    
    private func setupAddViews() {
        [
            titleLabel
        ].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    func configureView(with book: Book) {
        titleLabel.text = book.title
    }

}
