//
//  HomeFooterView.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation
import UIKit

class HomeFooterView: UIView {

    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let categorySeeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 120)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let flashSaleLabel: UILabel = {
        let label = UILabel()
        label.text = "Flash Sale"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countdownLabel: UILabel = {
        let label = UILabel()
        label.text = "02:59:23"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = UIColor.colorWithHexString(hexString: "#CCDA46")
        label.textColor = .black
        label.layer.cornerRadius = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()

    private let flashSaleSeeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let flashSaleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 260)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupViews()
        self.bindViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubviews(categoryTitleLabel, categorySeeAllButton, categoriesCollectionView,
                         flashSaleLabel, countdownLabel, flashSaleSeeAllButton,
                         flashSaleCollectionView)
        self.setupCollectionViews()
        self.applyConstraints()

    }

    private func bindViewModel() {
        self.viewModel.updateProductData = {
            self.categoriesCollectionView.reloadData()
            self.flashSaleCollectionView.reloadData()
        }
    }

    private func setupCollectionViews() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.defaultReuseIdentifier)

        flashSaleCollectionView.delegate = self
        flashSaleCollectionView.dataSource = self
        flashSaleCollectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.defaultReuseIdentifier)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            categoryTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            categorySeeAllButton.centerYAnchor.constraint(equalTo: categoryTitleLabel.centerYAnchor),
            categorySeeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            categoriesCollectionView.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 120),

            flashSaleLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 30),
            flashSaleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            countdownLabel.leadingAnchor.constraint(equalTo: flashSaleLabel.trailingAnchor, constant: 12),
            countdownLabel.centerYAnchor.constraint(equalTo: flashSaleLabel.centerYAnchor),
            countdownLabel.heightAnchor.constraint(equalToConstant: 22),
            countdownLabel.widthAnchor.constraint(equalToConstant: 80),

            flashSaleSeeAllButton.centerYAnchor.constraint(equalTo: flashSaleLabel.centerYAnchor),
            flashSaleSeeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            flashSaleCollectionView.topAnchor.constraint(equalTo: flashSaleLabel.bottomAnchor, constant: 16),
            flashSaleCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            flashSaleCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            flashSaleCollectionView.heightAnchor.constraint(equalToConstant: 260),
        ])
    }
}

extension HomeFooterView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == categoriesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(data: viewModel.getProductData(index: indexPath.row))
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? FlashSaleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(data: viewModel.getProductData(index: indexPath.row))
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  data = viewModel.getProductData(index: indexPath.row)
        self.viewModel.getProductDetails(id: data.id)
        self.viewModel.showProductDetails(id: data.id)
    }
}
