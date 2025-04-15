//
//  FlashSaleCollectionViewCell.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {

    private let productImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.text = "gokul when you will get a job?"
        return label
    }()

    private var priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "20.0"
        label.textColor = .black
        return label
    }()

    private var oldPriceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .strikethroughColor: UIColor.gray
        ]
        label.attributedText = NSAttributedString(string: "₹500.0", attributes: attributes)
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        self.setupViews()
        self.applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(productImageView, titleLabel, priceLabel, oldPriceLabel)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            productImageView.heightAnchor.constraint(equalToConstant: 175),

            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),

            oldPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            oldPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10)
        ])
    }

    func configure(data: ProductData) {
        productImageView.loadImage(imageUrl: data.image)
        titleLabel.text = data.title
        priceLabel.text = "$\(data.price)"
    }
}
