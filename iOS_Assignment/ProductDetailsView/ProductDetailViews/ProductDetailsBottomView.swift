//
//  ProductDetailsBottomView.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation
import UIKit

protocol GetActionToAddCartButton: AnyObject {
    func tapHeartButton()
}

class ProductDetailsBottomView: UIView {

    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()

    private let addToCartButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to cart", for: .normal)
        button.backgroundColor = UIColor(red: 0.83, green: 0.92, blue: 0.38, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(nil, action: #selector(addCartItemButtonTapped), for: .touchUpInside)
        return button
    }()

    private let deliveryLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Delivery on 26 October"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()

    private var viewModel: HomeViewModel
    weak var delegate: GetActionToAddCartButton?

    init(viewModel: HomeViewModel, delegate: GetActionToAddCartButton) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .zero)
        self.setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            buildInfoRow(),
            priceLabel,
            descriptionLabel,
            addToCartButton,
            deliveryLabel
        ])
        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),

            priceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func buildInfoRow() -> UIStackView {
        let rating = createInfoBadge(text: "⭐️ 4.8 ", subText: "117 reviews")
        let percent = createInfoBadge(text: "94% 👍", subText: "")
        let questions = createInfoBadge(text: "❓ 8", subText: "")

        let row = UIStackView(arrangedSubviews: [rating, percent, questions])
        row.axis = .horizontal
        row.spacing = 10
        row.distribution = .fillEqually
        return row
    }

    private func createInfoBadge(text: String, subText: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black

        let container = UIView()
        container.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 40)
        ])

        return container
    }

    func bindViewModel(data: ProductData) {
        titleLabel.text = data.title
        priceLabel.text = "\(data.price)"
        descriptionLabel.text = data.description
        print(data)
    }

    @objc private func addCartItemButtonTapped() {
        self.delegate?.tapHeartButton()
    }
}
