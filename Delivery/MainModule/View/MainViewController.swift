//
//  MainViewController.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    // MARK: - Private properties
    private var collectionView: UICollectionView! = nil
    
    // MARK: - LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupHierarchy()
    }
}

// MARK: - NavBar settings
extension MainViewController {
    private func setupNavBar() {
        title = "Delivery"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartButtonTapp))
    }
    
    @objc func cartButtonTapp() {
        print("Button Tapp")
    }
}

extension MainViewController: MainViewProtocol {
    func reloadData() {
        //        collectionView.reloadData()
    }
}

// MARK: - Collection View Settings
extension MainViewController {
    private func setupHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(PizzaCollectionViewCell.self, forCellWithReuseIdentifier: PizzaCollectionViewCell.identifier)
        collectionView.register(SushiCollectionViewCell.self, forCellWithReuseIdentifier: SushiCollectionViewCell.identifier)
        collectionView.register(DrinkCollectionViewCell.self, forCellWithReuseIdentifier: DrinkCollectionViewCell.identifier)
        collectionView.register(CollectionViewHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CollectionViewHeaderReusableView.identifier)
        collectionView.frame = view.bounds
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            
            let section = self.presenter.listItems[sectionIndex]
            
            switch section {
            case .pizza:
                
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                          height: .fractionalHeight(1),
                                                          spacing: 0)
                
                let group = CompositionalLayout.createGroup(alignment: .horizontal,
                                                            width: .absolute(200),
                                                            height: .absolute(240),
                                                            items: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 20, bottom: 30, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementaryContentInsetsReference = .readableContent
                return section
                
            case .drink:
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1.0/3.0),
                                                          height: .fractionalHeight(1),
                                                          spacing: 7)
                
                let group = CompositionalLayout.createGroup(alignment: .horizontal,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalWidth(0.35),
                                                            item: item,
                                                            count: 3)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 30
                section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
                
            case .sushi:
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                          height: .fractionalHeight(1),
                                                          spacing: 0)
                
                let group = CompositionalLayout.createGroup(alignment: .horizontal,
                                                            width: .fractionalWidth(0.45),
                                                            height: .fractionalHeight(0.24),
                                                            item: item,
                                                            count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 20, bottom: 40, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementaryContentInsetsReference = .readableContent
                return section
            }
        }
    }
    
    // Размеры ячейки заголовка
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.listItems!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.listItems![section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch presenter.listItems![indexPath.section] {
        case .pizza(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PizzaCollectionViewCell.identifier, for: indexPath) as? PizzaCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(item: items[indexPath.row])
            return cell
            
        case .sushi(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SushiCollectionViewCell.identifier, for: indexPath) as? SushiCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(item: items[indexPath.row])
            return cell
            
        case .drink(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectionViewCell.identifier, for: indexPath) as? DrinkCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(item: items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeaderReusableView.identifier, for: indexPath) as! CollectionViewHeaderReusableView
            header.setup(presenter.listItems![indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter.listItems[indexPath.section].items[indexPath.item]
        presenter.tapOnTheItem(item: item)
    }
}
