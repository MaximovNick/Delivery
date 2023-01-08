//
//  SushiCollectionViewCell.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

final class SushiCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SushiCollectionViewCell"
    
    // MARK - Private properties
    private let sushiImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.borderWidth = 0.3
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(sushiImageView)
        contentView.addSubview(titleLabel)
        setConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ListItem) {
        titleLabel.text = item.image
        sushiImageView.image = UIImage(named: item.image)
        sushiImageView.layoutIfNeeded()
        sushiImageView.layer.cornerRadius = 10
    }
    
    // MARK: - Private methods
    private func setupLayer() {
        contentView.layer.shadowRadius = 9
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 5, height: 12)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            sushiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            sushiImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sushiImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            sushiImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
}
