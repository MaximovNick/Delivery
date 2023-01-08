//
//  CollectionViewHeaderReusableView.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "CollectionViewHeaderReusableView"
    
    private let cellTitleLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cellTitleLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title: String) {
        cellTitleLabel.text = title
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
