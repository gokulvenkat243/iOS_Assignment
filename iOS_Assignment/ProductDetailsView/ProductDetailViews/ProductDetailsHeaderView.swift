//
//  ProductDetailsTopView.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation
import UIKit

protocol GetActionToHearchButton: AnyObject {
    func tapHeartButton()
}

class ProductDetailsHeaderView: UIView {

    private let productImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.systemGray6
        imageView.clipsToBounds = true
        return imageView
    }()

    private let backButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(nil, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()

    private let favoriteButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.addTarget(nil, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()

    private let shareButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .black
        return button
    }()

    private let navigationView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var viewModel: HomeViewModel
    weak var delegate: GetActionToHearchButton?

    init(viewModel: HomeViewModel, delegate: GetActionToHearchButton) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .zero)
        self.setupView()
        self.applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        navigationView.addSubview(backButton)
        navigationView.addSubview(favoriteButton)
        navigationView.addSubview(shareButton)

        self.addSubviews(productImage)
        self.addSubviews(navigationView)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([

            navigationView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            navigationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            navigationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            navigationView.heightAnchor.constraint(equalToConstant: 60),

            backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 46),
            backButton.heightAnchor.constraint(equalToConstant: 46),

            favoriteButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor),
            favoriteButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 46),
            favoriteButton.heightAnchor.constraint(equalToConstant: 46),

            shareButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -10),
            shareButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 46),
            shareButton.heightAnchor.constraint(equalToConstant: 46),

            productImage.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }

    func setHeartIcon(_ icon: UIImage?) {
        favoriteButton.setImage(icon, for: .normal)
    }

    func bindViewModel(data: ProductData) {
        productImage.loadImage(imageUrl: data.image)
        print(data)
    }

    @objc private func tapBackButton() {
        self.viewModel.backToHomeView()
    }

    @objc private func favoriteButtonTapped() {
        delegate?.tapHeartButton()
    }
}
