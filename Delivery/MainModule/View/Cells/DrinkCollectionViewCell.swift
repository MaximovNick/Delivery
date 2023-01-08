//
//  DrinkCollectionViewCell.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

final class DrinkCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DrinkCollectionViewCell"
    
    // MARK: - Private properties
    private let drinkImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
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
        
        contentView.addSubview(drinkImageView)
        contentView.addSubview(titleLabel)
        
        setConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ListItem) {
        titleLabel.text = item.title
        drinkImageView.image = UIImage(named: item.image)
        drinkImageView.layoutIfNeeded()
        drinkImageView.layer.cornerRadius = 10
    }
    
    // MARK: - Private methods
    private func setupLayer() {
        contentView.layer.shadowRadius = 9
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            drinkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            drinkImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            drinkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            drinkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        ])
    }
}
