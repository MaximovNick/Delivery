//
//  PizzaCollectionViewCell.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

final class PizzaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PizzaCollectionViewCell"
    
    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - LifeCycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ListItem) {
        titleLabel.text = item.image
        pizzaImageView.image = UIImage(named: item.image)
        pizzaImageView.layoutIfNeeded()
        pizzaImageView.layer.cornerRadius = pizzaImageView.frame.width / 2
    }
    
    // MARK: - Private methods
    private func setupLayer() {
        contentView.layer.shadowRadius = 9
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 5, height: 12)
    }
    
    private func setupConstraints() {
        contentView.addSubview(pizzaImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            pizzaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            pizzaImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            pizzaImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            pizzaImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 200),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
