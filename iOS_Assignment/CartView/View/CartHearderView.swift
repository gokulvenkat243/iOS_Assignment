//
//  CartHearderView.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import Foundation
import UIKit

class CartHeaderView: UIView {

    private let titleLabel = UILabel()
    private let moreButton = UIButton()
    private let addressView = UIView()
    private let addressLabel = UILabel()
    private let locationIcon = UIImageView()
    private let arrowIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .white

        titleLabel.text = "Cart"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)

        moreButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        moreButton.tintColor = .gray

        addressView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        addressView.layer.cornerRadius = 12

        locationIcon.image = UIImage(systemName: "location.fill")
        locationIcon.tintColor = .gray

        addressLabel.text = "92 High Street, London"
        addressLabel.font = .systemFont(ofSize: 14, weight: .medium)

        arrowIcon.image = UIImage(systemName: "chevron.right")
        arrowIcon.tintColor = .gray

        [titleLabel, moreButton, addressView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        [locationIcon, addressLabel, arrowIcon].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addressView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            addressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            addressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addressView.heightAnchor.constraint(equalToConstant: 44),

            locationIcon.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 12),
            locationIcon.centerYAnchor.constraint(equalTo: addressView.centerYAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 16),

            addressLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 8),
            addressLabel.centerYAnchor.constraint(equalTo: addressView.centerYAnchor),

            arrowIcon.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -12),
            arrowIcon.centerYAnchor.constraint(equalTo: addressView.centerYAnchor)
        ])
    }
}
