//
//  CartItemTableViewCell.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import UIKit

import UIKit

class CartItemTableViewCell: UITableViewCell {

    private let checkbox = UIImageView()
    private let productImage = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let quantityLabel = UILabel()
    private let minusButton = UIButton()
    private let plusButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

//    func configure(data: ProductData?) {
//        guard let data = data else {
//            return
//        }
//        titleLabel.text = data.title
//        priceLabel.text = "\(data.price)"
//        productImage.loadImage(imageUrl: data.image)
//    }

    func configure(title: String, price: String, imageName: String) {
        titleLabel.text = title
        priceLabel.text = price
        productImage.image = UIImage(named: imageName)
    }

    private func setupUI() {
        selectionStyle = .none

        checkbox.image = UIImage(systemName: "checkmark.circle.fill")
        checkbox.tintColor = UIColor(red: 0.69, green: 1.0, blue: 0.93, alpha: 1.0)

        productImage.contentMode = .scaleAspectFit
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        productImage.backgroundColor = UIColor(white: 0.95, alpha: 1)

        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.numberOfLines = 2

        priceLabel.font = .boldSystemFont(ofSize: 16)

        minusButton.setTitle("–", for: .normal)
        plusButton.setTitle("+", for: .normal)
        [minusButton, plusButton].forEach {
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = UIColor(white: 0.95, alpha: 1)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        }

        quantityLabel.text = "1"
        quantityLabel.font = .systemFont(ofSize: 16)
        quantityLabel.textAlignment = .center

        [checkbox, productImage, titleLabel, priceLabel, minusButton, quantityLabel, plusButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            checkbox.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            checkbox.widthAnchor.constraint(equalToConstant: 22),
            checkbox.heightAnchor.constraint(equalToConstant: 22),

            productImage.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 12),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productImage.widthAnchor.constraint(equalToConstant: 60),
            productImage.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.topAnchor.constraint(equalTo: productImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            minusButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor, constant: -8),
            minusButton.widthAnchor.constraint(equalToConstant: 24),
            minusButton.heightAnchor.constraint(equalToConstant: 24),

            quantityLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -8),
            quantityLabel.widthAnchor.constraint(equalToConstant: 24),

            plusButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
            plusButton.heightAnchor.constraint(equalToConstant: 24),

            contentView.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 12)
        ])
    }
}
