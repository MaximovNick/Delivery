//
//  DetailViewController.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 32)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let addProductButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.cornerStyle = .fixed
        button.configuration?.title = "Добавить в корзину"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setItem()
        view.backgroundColor = .white
        addProductButton.addTarget(self, action: #selector(addProductToCart), for: .touchUpInside)
        
        setupViews()
    }
    
    // MARK: - Private methods
    @objc private func addProductToCart() {
        print("Button tapped")
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func setItem(item: ListItem?) {
        titleLabel.text = item?.image ?? ""
        costLabel.text = "\(item?.cost ?? 0) ₽"
        descriptionLabel.text = item?.description ?? ""
        titleImageView.image = UIImage(named: item?.image ?? "")
    }
}

// MARK: - setViews
private extension DetailViewController {
    private func setupViews() {
        
        [titleLabel, titleImageView, descriptionLabel,
         costLabel, addProductButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleImageView.widthAnchor.constraint(equalToConstant: 250),
            titleImageView.heightAnchor.constraint(equalToConstant: 250),
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 20),
            costLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            addProductButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            addProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addProductButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
